class DispoPupilsController < ApplicationController
  before_action :set_dispo_pupil, only: [:show, :edit, :update, :destroy]

  # GET /dispo_pupils
  # GET /dispo_pupils.json
  def index
    @dispo_pupils = DispoPupil.all
  end

  # GET /dispo_pupils/1
  # GET /dispo_pupils/1.json
  def show
  end

  # GET /dispo_pupils/new
  def new
    @dispo_pupil = DispoPupil.new
  end

  # GET /dispo_pupils/1/edit
  def edit
  end

  # POST /dispo_pupils
  # POST /dispo_pupils.json
  def create
    @dispo_pupil = DispoPupil.new(dispo_pupil_params)

    respond_to do |format|
      if @dispo_pupil.save
        format.html { redirect_to @dispo_pupil, notice: 'Dispo pupil was successfully created.' }
        format.json { render :show, status: :created, location: @dispo_pupil }
      else
        format.html { render :new }
        format.json { render json: @dispo_pupil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dispo_pupils/1
  # PATCH/PUT /dispo_pupils/1.json
  def update
    respond_to do |format|
      if @dispo_pupil.update(dispo_pupil_params)
        format.html { redirect_to @dispo_pupil, notice: 'Dispo pupil was successfully updated.' }
        format.json { render :show, status: :ok, location: @dispo_pupil }
      else
        format.html { render :edit }
        format.json { render json: @dispo_pupil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dispo_pupils/1
  # DELETE /dispo_pupils/1.json
  def destroy
    @dispo_pupil.destroy
    respond_to do |format|
      format.html { redirect_to dispo_pupils_url, notice: 'Dispo pupil was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dispo_pupil
      @dispo_pupil = DispoPupil.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dispo_pupil_params
      params.require(:dispo_pupil).permit(:pupil_id, :integer, :date)
    end
end
