require 'test_helper'

class DispoUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dispo_user = dispo_users(:one)
  end

  test "should get index" do
    get dispo_users_url
    assert_response :success
  end

  test "should get new" do
    get new_dispo_user_url
    assert_response :success
  end

  test "should create dispo_user" do
    assert_difference('DispoUser.count') do
      post dispo_users_url, params: { dispo_user: { dispo: @dispo_user.dispo, user_id: @dispo_user.user_id } }
    end

    assert_redirected_to dispo_user_url(DispoUser.last)
  end

  test "should show dispo_user" do
    get dispo_user_url(@dispo_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_dispo_user_url(@dispo_user)
    assert_response :success
  end

  test "should update dispo_user" do
    patch dispo_user_url(@dispo_user), params: { dispo_user: { dispo: @dispo_user.dispo, user_id: @dispo_user.user_id } }
    assert_redirected_to dispo_user_url(@dispo_user)
  end

  test "should destroy dispo_user" do
    assert_difference('DispoUser.count', -1) do
      delete dispo_user_url(@dispo_user)
    end

    assert_redirected_to dispo_users_url
  end
end
