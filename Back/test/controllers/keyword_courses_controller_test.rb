require 'test_helper'

class KeywordCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @keyword_course = keyword_courses(:one)
  end

  test "should get index" do
    get keyword_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_keyword_course_url
    assert_response :success
  end

  test "should create keyword_course" do
    assert_difference('KeywordCourse.count') do
      post keyword_courses_url, params: { keyword_course: { course_id: @keyword_course.course_id, keyword: @keyword_course.keyword } }
    end

    assert_redirected_to keyword_course_url(KeywordCourse.last)
  end

  test "should show keyword_course" do
    get keyword_course_url(@keyword_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_keyword_course_url(@keyword_course)
    assert_response :success
  end

  test "should update keyword_course" do
    patch keyword_course_url(@keyword_course), params: { keyword_course: { course_id: @keyword_course.course_id, keyword: @keyword_course.keyword } }
    assert_redirected_to keyword_course_url(@keyword_course)
  end

  test "should destroy keyword_course" do
    assert_difference('KeywordCourse.count', -1) do
      delete keyword_course_url(@keyword_course)
    end

    assert_redirected_to keyword_courses_url
  end
end
