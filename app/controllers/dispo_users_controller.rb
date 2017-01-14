class DispoUsersController < ApplicationController
  before_action :set_dispo_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter  :verify_authenticity_token


  # GET /dispo_users
  # GET /dispo_users.json
  def index
    @dispo_users = DispoUser.all
  end

  # GET /dispo_users/1
  # GET /dispo_users/1.json
  def show
  end

  # GET /dispo_users/new
  def new
    @dispo_user = DispoUser.new
  end

  # GET /dispo_users/1/edit
  def edit
  end

  # POST /dispo_users
  # POST /dispo_users.json
  def create
    @dispo_user = DispoUser.new(dispo_user_params)

    respond_to do |format|
      if @dispo_user.save
        format.html { redirect_to @dispo_user, notice: 'Dispo user was successfully created.' }
        format.json { render :show, status: :created, location: @dispo_user }
      else
        format.html { render :new }
        format.json { render json: @dispo_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dispo_users/1
  # PATCH/PUT /dispo_users/1.json
  def update
    respond_to do |format|
      if @dispo_user.update(dispo_user_params)
        format.html { redirect_to @dispo_user, notice: 'Dispo user was successfully updated.' }
        format.json { render :show, status: :ok, location: @dispo_user }
      else
        format.html { render :edit }
        format.json { render json: @dispo_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dispo_users/1
  # DELETE /dispo_users/1.json
  def destroy
    @dispo_user.destroy
    respond_to do |format|
      format.html { redirect_to dispo_users_url, notice: 'Dispo user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dispo_user
      @dispo_user = DispoUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dispo_user_params
      params.require(:dispo_user).permit(:user_id, :dispo)
    end
end
