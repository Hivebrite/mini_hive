require "test_helper"

class Cms::PagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cms_page = cms_pages(:one)
  end

  test "should get index" do
    get cms_pages_url
    assert_response :success
  end

  test "should get new" do
    get new_cms_page_url
    assert_response :success
  end

  test "should create cms_page" do
    assert_difference("Cms::Page.count") do
      post cms_pages_url, params: { cms_page: { content: @cms_page.content, title: @cms_page.title } }
    end

    assert_redirected_to cms_page_url(Cms::Page.last)
  end

  test "should show cms_page" do
    get cms_page_url(@cms_page)
    assert_response :success
  end

  test "should get edit" do
    get edit_cms_page_url(@cms_page)
    assert_response :success
  end

  test "should update cms_page" do
    patch cms_page_url(@cms_page), params: { cms_page: { content: @cms_page.content, title: @cms_page.title } }
    assert_redirected_to cms_page_url(@cms_page)
  end

  test "should destroy cms_page" do
    assert_difference("Cms::Page.count", -1) do
      delete cms_page_url(@cms_page)
    end

    assert_redirected_to cms_pages_url
  end
end
