require 'test_helper'

class UserVerifsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_verif = user_verifs(:one)
  end

  test "should get index" do
    get user_verifs_url
    assert_response :success
  end

  test "should get new" do
    get new_user_verif_url
    assert_response :success
  end

  test "should create user_verif" do
    assert_difference('UserVerif.count') do
      post user_verifs_url, params: { user_verif: { code: @user_verif.code, user_id: @user_verif.user_id } }
    end

    assert_redirected_to user_verif_url(UserVerif.last)
  end

  test "should show user_verif" do
    get user_verif_url(@user_verif)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_verif_url(@user_verif)
    assert_response :success
  end

  test "should update user_verif" do
    patch user_verif_url(@user_verif), params: { user_verif: { code: @user_verif.code, user_id: @user_verif.user_id } }
    assert_redirected_to user_verif_url(@user_verif)
  end

  test "should destroy user_verif" do
    assert_difference('UserVerif.count', -1) do
      delete user_verif_url(@user_verif)
    end

    assert_redirected_to user_verifs_url
  end
end
