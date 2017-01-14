require 'test_helper'

class FeedBacksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @feed_back = feed_backs(:one)
  end

  test "should get index" do
    get feed_backs_url
    assert_response :success
  end

  test "should get new" do
    get new_feed_back_url
    assert_response :success
  end

  test "should create feed_back" do
    assert_difference('FeedBack.count') do
      post feed_backs_url, params: { feed_back: { comment: @feed_back.comment, feed_backer_id: @feed_back.feed_backer_id, lessons_id: @feed_back.lessons_id, note: @feed_back.note } }
    end

    assert_redirected_to feed_back_url(FeedBack.last)
  end

  test "should show feed_back" do
    get feed_back_url(@feed_back)
    assert_response :success
  end

  test "should get edit" do
    get edit_feed_back_url(@feed_back)
    assert_response :success
  end

  test "should update feed_back" do
    patch feed_back_url(@feed_back), params: { feed_back: { comment: @feed_back.comment, feed_backer_id: @feed_back.feed_backer_id, lessons_id: @feed_back.lessons_id, note: @feed_back.note } }
    assert_redirected_to feed_back_url(@feed_back)
  end

  test "should destroy feed_back" do
    assert_difference('FeedBack.count', -1) do
      delete feed_back_url(@feed_back)
    end

    assert_redirected_to feed_backs_url
  end
end
