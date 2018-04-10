require 'test_helper'

class MovieuploadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movieupload = movieuploads(:one)
  end

  test "should get index" do
    get movieuploads_url
    assert_response :success
  end

  test "should get new" do
    get new_movieupload_url
    assert_response :success
  end

  test "should create movieupload" do
    assert_difference('Movieupload.count') do
      post movieuploads_url, params: { movieupload: { description: @movieupload.description, name: @movieupload.name, rating: @movieupload.rating } }
    end

    assert_redirected_to movieupload_url(Movieupload.last)
  end

  test "should show movieupload" do
    get movieupload_url(@movieupload)
    assert_response :success
  end

  test "should get edit" do
    get edit_movieupload_url(@movieupload)
    assert_response :success
  end

  test "should update movieupload" do
    patch movieupload_url(@movieupload), params: { movieupload: { description: @movieupload.description, name: @movieupload.name, rating: @movieupload.rating } }
    assert_redirected_to movieupload_url(@movieupload)
  end

  test "should destroy movieupload" do
    assert_difference('Movieupload.count', -1) do
      delete movieupload_url(@movieupload)
    end

    assert_redirected_to movieuploads_url
  end
end
