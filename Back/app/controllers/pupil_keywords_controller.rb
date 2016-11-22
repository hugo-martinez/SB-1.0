class PupilKeywordsController < ApplicationController
  before_action :set_pupil_keyword, only: [:show, :edit, :update, :destroy]

  # GET /pupil_keywords
  # GET /pupil_keywords.json
  def index
    @pupil_keywords = PupilKeyword.all
  end

  # GET /pupil_keywords/1
  # GET /pupil_keywords/1.json
  def show
  end

  # GET /pupil_keywords/new
  def new
    @pupil_keyword = PupilKeyword.new
  end

  # GET /pupil_keywords/1/edit
  def edit
  end

  # POST /pupil_keywords
  # POST /pupil_keywords.json
  def create
    @pupil_keyword = PupilKeyword.new(pupil_keyword_params)

    respond_to do |format|
      if @pupil_keyword.save
        format.html { redirect_to @pupil_keyword, notice: 'Pupil keyword was successfully created.' }
        format.json { render :show, status: :created, location: @pupil_keyword }
      else
        format.html { render :new }
        format.json { render json: @pupil_keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pupil_keywords/1
  # PATCH/PUT /pupil_keywords/1.json
  def update
    respond_to do |format|
      if @pupil_keyword.update(pupil_keyword_params)
        format.html { redirect_to @pupil_keyword, notice: 'Pupil keyword was successfully updated.' }
        format.json { render :show, status: :ok, location: @pupil_keyword }
      else
        format.html { render :edit }
        format.json { render json: @pupil_keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pupil_keywords/1
  # DELETE /pupil_keywords/1.json
  def destroy
    @pupil_keyword.destroy
    respond_to do |format|
      format.html { redirect_to pupil_keywords_url, notice: 'Pupil keyword was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pupil_keyword
      @pupil_keyword = PupilKeyword.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pupil_keyword_params
      params.require(:pupil_keyword).permit(:pupil_id, :integer, :keyword, :string)
    end
end
