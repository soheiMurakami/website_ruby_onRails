require 'test_helper'

class CsvuploadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @csvupload = csvuploads(:one)
  end

  test "should get index" do
    get csvuploads_url
    assert_response :success
  end

  test "should get new" do
    get new_csvupload_url
    assert_response :success
  end

  test "should create csvupload" do
    assert_difference('Csvupload.count') do
      post csvuploads_url, params: { csvupload: { description: @csvupload.description, name: @csvupload.name, rating: @csvupload.rating } }
    end

    assert_redirected_to csvupload_url(Csvupload.last)
  end

  test "should show csvupload" do
    get csvupload_url(@csvupload)
    assert_response :success
  end

  test "should get edit" do
    get edit_csvupload_url(@csvupload)
    assert_response :success
  end

  test "should update csvupload" do
    patch csvupload_url(@csvupload), params: { csvupload: { description: @csvupload.description, name: @csvupload.name, rating: @csvupload.rating } }
    assert_redirected_to csvupload_url(@csvupload)
  end

  test "should destroy csvupload" do
    assert_difference('Csvupload.count', -1) do
      delete csvupload_url(@csvupload)
    end

    assert_redirected_to csvuploads_url
  end
end
