require "application_system_test_case"

class Cms::PagesTest < ApplicationSystemTestCase
  setup do
    @cms_page = cms_pages(:one)
  end

  test "visiting the index" do
    visit cms_pages_url
    assert_selector "h1", text: "Pages"
  end

  test "should create page" do
    visit cms_pages_url
    click_on "New page"

    fill_in "Content", with: @cms_page.content
    fill_in "Title", with: @cms_page.title
    click_on "Create Page"

    assert_text "Page was successfully created"
    click_on "Back"
  end

  test "should update Page" do
    visit cms_page_url(@cms_page)
    click_on "Edit this page", match: :first

    fill_in "Content", with: @cms_page.content
    fill_in "Title", with: @cms_page.title
    click_on "Update Page"

    assert_text "Page was successfully updated"
    click_on "Back"
  end

  test "should destroy Page" do
    visit cms_page_url(@cms_page)
    click_on "Destroy this page", match: :first

    assert_text "Page was successfully destroyed"
  end
end
