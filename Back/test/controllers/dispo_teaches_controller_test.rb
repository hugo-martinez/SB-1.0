require 'test_helper'

class DispoTeachesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dispo_teach = dispo_teaches(:one)
  end

  test "should get index" do
    get dispo_teaches_url
    assert_response :success
  end

  test "should get new" do
    get new_dispo_teach_url
    assert_response :success
  end

  test "should create dispo_teach" do
    assert_difference('DispoTeach.count') do
      post dispo_teaches_url, params: { dispo_teach: { date: @dispo_teach.date, integer: @dispo_teach.integer, teach_id: @dispo_teach.teach_id } }
    end

    assert_redirected_to dispo_teach_url(DispoTeach.last)
  end

  test "should show dispo_teach" do
    get dispo_teach_url(@dispo_teach)
    assert_response :success
  end

  test "should get edit" do
    get edit_dispo_teach_url(@dispo_teach)
    assert_response :success
  end

  test "should update dispo_teach" do
    patch dispo_teach_url(@dispo_teach), params: { dispo_teach: { date: @dispo_teach.date, integer: @dispo_teach.integer, teach_id: @dispo_teach.teach_id } }
    assert_redirected_to dispo_teach_url(@dispo_teach)
  end

  test "should destroy dispo_teach" do
    assert_difference('DispoTeach.count', -1) do
      delete dispo_teach_url(@dispo_teach)
    end

    assert_redirected_to dispo_teaches_url
  end
end
