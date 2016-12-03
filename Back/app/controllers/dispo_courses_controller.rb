class DispoCoursesController < ApplicationController
  before_action :set_dispo_course, only: [:show, :edit, :update, :destroy]

  # GET /dispo_courses
  # GET /dispo_courses.json
  def index
    @dispo_courses = DispoCourse.all
  end

  # GET /dispo_courses/1
  # GET /dispo_courses/1.json
  def show
  end

  # GET /dispo_courses/new
  def new
    @dispo_course = DispoCourse.new
  end

  # GET /dispo_courses/1/edit
  def edit
  end

  # POST /dispo_courses
  # POST /dispo_courses.json
  def create
    @dispo_course = DispoCourse.new(dispo_course_params)

    respond_to do |format|
      if @dispo_course.save
        format.html { redirect_to @dispo_course, notice: 'Dispo course was successfully created.' }
        format.json { render :show, status: :created, location: @dispo_course }
      else
        format.html { render :new }
        format.json { render json: @dispo_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dispo_courses/1
  # PATCH/PUT /dispo_courses/1.json
  def update
    respond_to do |format|
      if @dispo_course.update(dispo_course_params)
        format.html { redirect_to @dispo_course, notice: 'Dispo course was successfully updated.' }
        format.json { render :show, status: :ok, location: @dispo_course }
      else
        format.html { render :edit }
        format.json { render json: @dispo_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dispo_courses/1
  # DELETE /dispo_courses/1.json
  def destroy
    @dispo_course.destroy
    respond_to do |format|
      format.html { redirect_to dispo_courses_url, notice: 'Dispo course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dispo_course
      @dispo_course = DispoCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dispo_course_params
      params.require(:dispo_course).permit(:course_id, :date)
    end
end
