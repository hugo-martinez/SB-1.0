require 'test_helper'

class PupilKeywordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pupil_keyword = pupil_keywords(:one)
  end

  test "should get index" do
    get pupil_keywords_url
    assert_response :success
  end

  test "should get new" do
    get new_pupil_keyword_url
    assert_response :success
  end

  test "should create pupil_keyword" do
    assert_difference('PupilKeyword.count') do
      post pupil_keywords_url, params: { pupil_keyword: { integer: @pupil_keyword.integer, keyword: @pupil_keyword.keyword, pupil_id: @pupil_keyword.pupil_id, string: @pupil_keyword.string } }
    end

    assert_redirected_to pupil_keyword_url(PupilKeyword.last)
  end

  test "should show pupil_keyword" do
    get pupil_keyword_url(@pupil_keyword)
    assert_response :success
  end

  test "should get edit" do
    get edit_pupil_keyword_url(@pupil_keyword)
    assert_response :success
  end

  test "should update pupil_keyword" do
    patch pupil_keyword_url(@pupil_keyword), params: { pupil_keyword: { integer: @pupil_keyword.integer, keyword: @pupil_keyword.keyword, pupil_id: @pupil_keyword.pupil_id, string: @pupil_keyword.string } }
    assert_redirected_to pupil_keyword_url(@pupil_keyword)
  end

  test "should destroy pupil_keyword" do
    assert_difference('PupilKeyword.count', -1) do
      delete pupil_keyword_url(@pupil_keyword)
    end

    assert_redirected_to pupil_keywords_url
  end
end
