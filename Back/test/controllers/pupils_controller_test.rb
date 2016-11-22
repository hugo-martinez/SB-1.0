require 'test_helper'

class PupilsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pupil = pupils(:one)
  end

  test "should get index" do
    get pupils_url
    assert_response :success
  end

  test "should get new" do
    get new_pupil_url
    assert_response :success
  end

  test "should create pupil" do
    assert_difference('Pupil.count') do
      post pupils_url, params: { pupil: { integer: @pupil.integer, integer: @pupil.integer, theme_id: @pupil.theme_id, user_id: @pupil.user_id } }
    end

    assert_redirected_to pupil_url(Pupil.last)
  end

  test "should show pupil" do
    get pupil_url(@pupil)
    assert_response :success
  end

  test "should get edit" do
    get edit_pupil_url(@pupil)
    assert_response :success
  end

  test "should update pupil" do
    patch pupil_url(@pupil), params: { pupil: { integer: @pupil.integer, integer: @pupil.integer, theme_id: @pupil.theme_id, user_id: @pupil.user_id } }
    assert_redirected_to pupil_url(@pupil)
  end

  test "should destroy pupil" do
    assert_difference('Pupil.count', -1) do
      delete pupil_url(@pupil)
    end

    assert_redirected_to pupils_url
  end
end
