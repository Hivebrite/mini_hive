require "test_helper"

class MediaCenter::FilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @media_center_file = media_center_files(:one)
  end

  test "should get index" do
    get media_center_files_url
    assert_response :success
  end

  test "should get new" do
    get new_media_center_file_url
    assert_response :success
  end

  test "should create media_center_file" do
    assert_difference("MediaCenter::File.count") do
      post media_center_files_url, params: { media_center_file: { name: @media_center_file.name, url: @media_center_file.url } }
    end

    assert_redirected_to media_center_file_url(MediaCenter::File.last)
  end

  test "should show media_center_file" do
    get media_center_file_url(@media_center_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_media_center_file_url(@media_center_file)
    assert_response :success
  end

  test "should update media_center_file" do
    patch media_center_file_url(@media_center_file), params: { media_center_file: { name: @media_center_file.name, url: @media_center_file.url } }
    assert_redirected_to media_center_file_url(@media_center_file)
  end

  test "should destroy media_center_file" do
    assert_difference("MediaCenter::File.count", -1) do
      delete media_center_file_url(@media_center_file)
    end

    assert_redirected_to media_center_files_url
  end
end
