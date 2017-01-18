class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter  :verify_authenticity_token

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def send_simple_message(Message_content)
    RestClient.post "https://api:key-4007fdb4f5fcfcbe8cd7094a60b1fcd6"\
    "@api.mailgun.net/v3/skillybox.com/messages",
    :from => "Skillybox <mail@skillybox.com>",
    :to => "hugo.martinez@polytechnique.edu, thomas.bessiere@polytechnique.edu",
    :subject => "Hello",
    :text => Message_content
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  require 'securerandom'
  require 'textbelt'

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        UserVerif.create(user_id: @user.id, code: SecureRandom.hex)
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
        send_simple_message('user_params')
        #TextBelt.text('0033665783311', 'MOtherfucking Skilybox', 'france')
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    if params[:email]
      then
      user_n = User.where(email: params[:email]).first
      if params[:password]
        if user_n.password = params[:password]
          then @user = user_n
        else
          @user = nil
        end
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :password, :email, :phone_number, :nb_skilly, :birth_date, :location, :photo, :verif)
    end
end
