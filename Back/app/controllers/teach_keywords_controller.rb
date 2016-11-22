class TeachKeywordsController < ApplicationController
  before_action :set_teach_keyword, only: [:show, :edit, :update, :destroy]

  # GET /teach_keywords
  # GET /teach_keywords.json
  def index
    @teach_keywords = TeachKeyword.all
  end

  # GET /teach_keywords/1
  # GET /teach_keywords/1.json
  def show
  end

  # GET /teach_keywords/new
  def new
    @teach_keyword = TeachKeyword.new
  end

  # GET /teach_keywords/1/edit
  def edit
  end

  # POST /teach_keywords
  # POST /teach_keywords.json
  def create
    @teach_keyword = TeachKeyword.new(teach_keyword_params)

    respond_to do |format|
      if @teach_keyword.save
        format.html { redirect_to @teach_keyword, notice: 'Teach keyword was successfully created.' }
        format.json { render :show, status: :created, location: @teach_keyword }
      else
        format.html { render :new }
        format.json { render json: @teach_keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teach_keywords/1
  # PATCH/PUT /teach_keywords/1.json
  def update
    respond_to do |format|
      if @teach_keyword.update(teach_keyword_params)
        format.html { redirect_to @teach_keyword, notice: 'Teach keyword was successfully updated.' }
        format.json { render :show, status: :ok, location: @teach_keyword }
      else
        format.html { render :edit }
        format.json { render json: @teach_keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teach_keywords/1
  # DELETE /teach_keywords/1.json
  def destroy
    @teach_keyword.destroy
    respond_to do |format|
      format.html { redirect_to teach_keywords_url, notice: 'Teach keyword was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teach_keyword
      @teach_keyword = TeachKeyword.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teach_keyword_params
      params.require(:teach_keyword).permit(:teach_id, :integer, :keyword, :string)
    end
end
