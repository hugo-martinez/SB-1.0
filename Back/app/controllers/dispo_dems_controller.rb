class DispoDemsController < ApplicationController
  before_action :set_dispo_dem, only: [:show, :edit, :update, :destroy]

  # GET /dispo_dems
  # GET /dispo_dems.json
  def index
    @dispo_dems = DispoDem.all
  end

  # GET /dispo_dems/1
  # GET /dispo_dems/1.json
  def show
  end

  # GET /dispo_dems/new
  def new
    @dispo_dem = DispoDem.new
  end

  # GET /dispo_dems/1/edit
  def edit
  end

  # POST /dispo_dems
  # POST /dispo_dems.json
  def create
    @dispo_dem = DispoDem.new(dispo_dem_params)

    respond_to do |format|
      if @dispo_dem.save
        format.html { redirect_to @dispo_dem, notice: 'Dispo dem was successfully created.' }
        format.json { render :show, status: :created, location: @dispo_dem }
      else
        format.html { render :new }
        format.json { render json: @dispo_dem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dispo_dems/1
  # PATCH/PUT /dispo_dems/1.json
  def update
    respond_to do |format|
      if @dispo_dem.update(dispo_dem_params)
        format.html { redirect_to @dispo_dem, notice: 'Dispo dem was successfully updated.' }
        format.json { render :show, status: :ok, location: @dispo_dem }
      else
        format.html { render :edit }
        format.json { render json: @dispo_dem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dispo_dems/1
  # DELETE /dispo_dems/1.json
  def destroy
    @dispo_dem.destroy
    respond_to do |format|
      format.html { redirect_to dispo_dems_url, notice: 'Dispo dem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dispo_dem
      @dispo_dem = DispoDem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dispo_dem_params
      params.require(:dispo_dem).permit(:dem_id, :date)
    end
end
