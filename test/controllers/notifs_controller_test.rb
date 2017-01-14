require 'test_helper'

class NotifsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notif = notifs(:one)
  end

  test "should get index" do
    get notifs_url
    assert_response :success
  end

  test "should get new" do
    get new_notif_url
    assert_response :success
  end

  test "should create notif" do
    assert_difference('Notif.count') do
      post notifs_url, params: { notif: { msg: @notif.msg, status: @notif.status, title: @notif.title, url: @notif.url, user_id: @notif.user_id } }
    end

    assert_redirected_to notif_url(Notif.last)
  end

  test "should show notif" do
    get notif_url(@notif)
    assert_response :success
  end

  test "should get edit" do
    get edit_notif_url(@notif)
    assert_response :success
  end

  test "should update notif" do
    patch notif_url(@notif), params: { notif: { msg: @notif.msg, status: @notif.status, title: @notif.title, url: @notif.url, user_id: @notif.user_id } }
    assert_redirected_to notif_url(@notif)
  end

  test "should destroy notif" do
    assert_difference('Notif.count', -1) do
      delete notif_url(@notif)
    end

    assert_redirected_to notifs_url
  end
end
