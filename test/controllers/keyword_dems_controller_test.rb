require 'test_helper'

class KeywordDemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @keyword_dem = keyword_dems(:one)
  end

  test "should get index" do
    get keyword_dems_url
    assert_response :success
  end

  test "should get new" do
    get new_keyword_dem_url
    assert_response :success
  end

  test "should create keyword_dem" do
    assert_difference('KeywordDem.count') do
      post keyword_dems_url, params: { keyword_dem: { dem_id: @keyword_dem.dem_id, keyword_id: @keyword_dem.keyword_id } }
    end

    assert_redirected_to keyword_dem_url(KeywordDem.last)
  end

  test "should show keyword_dem" do
    get keyword_dem_url(@keyword_dem)
    assert_response :success
  end

  test "should get edit" do
    get edit_keyword_dem_url(@keyword_dem)
    assert_response :success
  end

  test "should update keyword_dem" do
    patch keyword_dem_url(@keyword_dem), params: { keyword_dem: { dem_id: @keyword_dem.dem_id, keyword_id: @keyword_dem.keyword_id } }
    assert_redirected_to keyword_dem_url(@keyword_dem)
  end

  test "should destroy keyword_dem" do
    assert_difference('KeywordDem.count', -1) do
      delete keyword_dem_url(@keyword_dem)
    end

    assert_redirected_to keyword_dems_url
  end
end
