require 'test_helper'

class TeachKeywordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teach_keyword = teach_keywords(:one)
  end

  test "should get index" do
    get teach_keywords_url
    assert_response :success
  end

  test "should get new" do
    get new_teach_keyword_url
    assert_response :success
  end

  test "should create teach_keyword" do
    assert_difference('TeachKeyword.count') do
      post teach_keywords_url, params: { teach_keyword: { integer: @teach_keyword.integer, keyword: @teach_keyword.keyword, string: @teach_keyword.string, teach_id: @teach_keyword.teach_id } }
    end

    assert_redirected_to teach_keyword_url(TeachKeyword.last)
  end

  test "should show teach_keyword" do
    get teach_keyword_url(@teach_keyword)
    assert_response :success
  end

  test "should get edit" do
    get edit_teach_keyword_url(@teach_keyword)
    assert_response :success
  end

  test "should update teach_keyword" do
    patch teach_keyword_url(@teach_keyword), params: { teach_keyword: { integer: @teach_keyword.integer, keyword: @teach_keyword.keyword, string: @teach_keyword.string, teach_id: @teach_keyword.teach_id } }
    assert_redirected_to teach_keyword_url(@teach_keyword)
  end

  test "should destroy teach_keyword" do
    assert_difference('TeachKeyword.count', -1) do
      delete teach_keyword_url(@teach_keyword)
    end

    assert_redirected_to teach_keywords_url
  end
end
