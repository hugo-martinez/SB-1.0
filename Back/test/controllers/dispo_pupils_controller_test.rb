require 'test_helper'

class DispoPupilsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dispo_pupil = dispo_pupils(:one)
  end

  test "should get index" do
    get dispo_pupils_url
    assert_response :success
  end

  test "should get new" do
    get new_dispo_pupil_url
    assert_response :success
  end

  test "should create dispo_pupil" do
    assert_difference('DispoPupil.count') do
      post dispo_pupils_url, params: { dispo_pupil: { date: @dispo_pupil.date, integer: @dispo_pupil.integer, pupil_id: @dispo_pupil.pupil_id } }
    end

    assert_redirected_to dispo_pupil_url(DispoPupil.last)
  end

  test "should show dispo_pupil" do
    get dispo_pupil_url(@dispo_pupil)
    assert_response :success
  end

  test "should get edit" do
    get edit_dispo_pupil_url(@dispo_pupil)
    assert_response :success
  end

  test "should update dispo_pupil" do
    patch dispo_pupil_url(@dispo_pupil), params: { dispo_pupil: { date: @dispo_pupil.date, integer: @dispo_pupil.integer, pupil_id: @dispo_pupil.pupil_id } }
    assert_redirected_to dispo_pupil_url(@dispo_pupil)
  end

  test "should destroy dispo_pupil" do
    assert_difference('DispoPupil.count', -1) do
      delete dispo_pupil_url(@dispo_pupil)
    end

    assert_redirected_to dispo_pupils_url
  end
end
