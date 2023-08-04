require "application_system_test_case"

class MediaCenter::FilesTest < ApplicationSystemTestCase
  setup do
    @media_center_file = media_center_files(:one)
  end

  test "visiting the index" do
    visit media_center_files_url
    assert_selector "h1", text: "Files"
  end

  test "should create file" do
    visit media_center_files_url
    click_on "New file"

    fill_in "Name", with: @media_center_file.name
    fill_in "Url", with: @media_center_file.url
    click_on "Create File"

    assert_text "File was successfully created"
    click_on "Back"
  end

  test "should update File" do
    visit media_center_file_url(@media_center_file)
    click_on "Edit this file", match: :first

    fill_in "Name", with: @media_center_file.name
    fill_in "Url", with: @media_center_file.url
    click_on "Update File"

    assert_text "File was successfully updated"
    click_on "Back"
  end

  test "should destroy File" do
    visit media_center_file_url(@media_center_file)
    click_on "Destroy this file", match: :first

    assert_text "File was successfully destroyed"
  end
end
