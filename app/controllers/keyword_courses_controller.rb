class KeywordCoursesController < ApplicationController
  before_action :set_keyword_course, only: [:show, :edit, :update, :destroy]

  # GET /keyword_courses
  # GET /keyword_courses.json
  def index
    @keyword_courses = KeywordCourse.all
  end

  # GET /keyword_courses/1
  # GET /keyword_courses/1.json
  def show
  end

  # GET /keyword_courses/new
  def new
    @keyword_course = KeywordCourse.new
  end

  # GET /keyword_courses/1/edit
  def edit
  end

  # POST /keyword_courses
  # POST /keyword_courses.json
  def create
    @keyword_course = KeywordCourse.new(keyword_course_params)

    respond_to do |format|
      if @keyword_course.save
        format.html { redirect_to @keyword_course, notice: 'Keyword course was successfully created.' }
        format.json { render :show, status: :created, location: @keyword_course }
      else
        format.html { render :new }
        format.json { render json: @keyword_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /keyword_courses/1
  # PATCH/PUT /keyword_courses/1.json
  def update
    respond_to do |format|
      if @keyword_course.update(keyword_course_params)
        format.html { redirect_to @keyword_course, notice: 'Keyword course was successfully updated.' }
        format.json { render :show, status: :ok, location: @keyword_course }
      else
        format.html { render :edit }
        format.json { render json: @keyword_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /keyword_courses/1
  # DELETE /keyword_courses/1.json
  def destroy
    @keyword_course.destroy
    respond_to do |format|
      format.html { redirect_to keyword_courses_url, notice: 'Keyword course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_keyword_course
      @keyword_course = KeywordCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def keyword_course_params
      params.require(:keyword_course).permit(:course_id, :keyword_id)
    end
end
