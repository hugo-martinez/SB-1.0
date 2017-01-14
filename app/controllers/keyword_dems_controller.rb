class KeywordDemsController < ApplicationController
  before_action :set_keyword_dem, only: [:show, :edit, :update, :destroy]
  skip_before_filter  :verify_authenticity_token


  # GET /keyword_dems
  # GET /keyword_dems.json
  def index
    @keyword_dems = KeywordDem.all
  end

  # GET /keyword_dems/1
  # GET /keyword_dems/1.json
  def show
  end

  # GET /keyword_dems/new
  def new
    @keyword_dem = KeywordDem.new
  end

  # GET /keyword_dems/1/edit
  def edit
  end

  # POST /keyword_dems
  # POST /keyword_dems.json
  def create
    @keyword_dem = KeywordDem.new(keyword_dem_params)

    respond_to do |format|
      if @keyword_dem.save
        format.html { redirect_to @keyword_dem, notice: 'Keyword dem was successfully created.' }
        format.json { render :show, status: :created, location: @keyword_dem }
      else
        format.html { render :new }
        format.json { render json: @keyword_dem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /keyword_dems/1
  # PATCH/PUT /keyword_dems/1.json
  def update
    respond_to do |format|
      if @keyword_dem.update(keyword_dem_params)
        format.html { redirect_to @keyword_dem, notice: 'Keyword dem was successfully updated.' }
        format.json { render :show, status: :ok, location: @keyword_dem }
      else
        format.html { render :edit }
        format.json { render json: @keyword_dem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /keyword_dems/1
  # DELETE /keyword_dems/1.json
  def destroy
    @keyword_dem.destroy
    respond_to do |format|
      format.html { redirect_to keyword_dems_url, notice: 'Keyword dem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_keyword_dem
      @keyword_dem = KeywordDem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def keyword_dem_params
      params.require(:keyword_dem).permit(:dem_id, :keyword_id)
    end
end
