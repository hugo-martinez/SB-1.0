require 'test_helper'

class DispoCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dispo_course = dispo_courses(:one)
  end

  test "should get index" do
    get dispo_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_dispo_course_url
    assert_response :success
  end

  test "should create dispo_course" do
    assert_difference('DispoCourse.count') do
      post dispo_courses_url, params: { dispo_course: { course_id: @dispo_course.course_id, date: @dispo_course.date } }
    end

    assert_redirected_to dispo_course_url(DispoCourse.last)
  end

  test "should show dispo_course" do
    get dispo_course_url(@dispo_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_dispo_course_url(@dispo_course)
    assert_response :success
  end

  test "should update dispo_course" do
    patch dispo_course_url(@dispo_course), params: { dispo_course: { course_id: @dispo_course.course_id, date: @dispo_course.date } }
    assert_redirected_to dispo_course_url(@dispo_course)
  end

  test "should destroy dispo_course" do
    assert_difference('DispoCourse.count', -1) do
      delete dispo_course_url(@dispo_course)
    end

    assert_redirected_to dispo_courses_url
  end
end
