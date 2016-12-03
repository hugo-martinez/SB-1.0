require 'test_helper'

class DispoDemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dispo_dem = dispo_dems(:one)
  end

  test "should get index" do
    get dispo_dems_url
    assert_response :success
  end

  test "should get new" do
    get new_dispo_dem_url
    assert_response :success
  end

  test "should create dispo_dem" do
    assert_difference('DispoDem.count') do
      post dispo_dems_url, params: { dispo_dem: { date: @dispo_dem.date, dem_id: @dispo_dem.dem_id } }
    end

    assert_redirected_to dispo_dem_url(DispoDem.last)
  end

  test "should show dispo_dem" do
    get dispo_dem_url(@dispo_dem)
    assert_response :success
  end

  test "should get edit" do
    get edit_dispo_dem_url(@dispo_dem)
    assert_response :success
  end

  test "should update dispo_dem" do
    patch dispo_dem_url(@dispo_dem), params: { dispo_dem: { date: @dispo_dem.date, dem_id: @dispo_dem.dem_id } }
    assert_redirected_to dispo_dem_url(@dispo_dem)
  end

  test "should destroy dispo_dem" do
    assert_difference('DispoDem.count', -1) do
      delete dispo_dem_url(@dispo_dem)
    end

    assert_redirected_to dispo_dems_url
  end
end
