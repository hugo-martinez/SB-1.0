class UserVerifsController < ApplicationController
  before_action :set_user_verif, only: [:show, :edit, :update, :destroy]
  skip_before_filter  :verify_authenticity_token

  # GET /user_verifs
  # GET /user_verifs.json
  def index
    @user_verifs = UserVerif.all
  end

  # GET /user_verifs/1
  # GET /user_verifs/1.json
  def show
  end

  # GET /user_verifs/new
  def new
    @user_verif = UserVerif.new
  end

  # GET /user_verifs/1/edit
  def edit
  end

  # POST /user_verifs
  # POST /user_verifs.json
  def create
    @user_verif = UserVerif.new(user_verif_params)

    respond_to do |format|
      if @user_verif.save
        format.html { redirect_to @user_verif, notice: 'User verif was successfully created.' }
        format.json { render :show, status: :created, location: @user_verif }
      else
        format.html { render :new }
        format.json { render json: @user_verif.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_verifs/1
  # PATCH/PUT /user_verifs/1.json
  def update
    respond_to do |format|
      if @user_verif.update(user_verif_params)
        format.html { redirect_to @user_verif, notice: 'User verif was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_verif }
      else
        format.html { render :edit }
        format.json { render json: @user_verif.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_verifs/1
  # DELETE /user_verifs/1.json
  def destroy
    @user_verif.destroy
    respond_to do |format|
      format.html { redirect_to user_verifs_url, notice: 'User verif was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_verif
      @user_verif = UserVerif.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_verif_params
      params.require(:user_verif).permit(:user_id, :code)
    end
end
