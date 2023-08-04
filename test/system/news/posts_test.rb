require "application_system_test_case"

class News::PostsTest < ApplicationSystemTestCase
  setup do
    @news_post = news_posts(:one)
  end

  test "visiting the index" do
    visit news_posts_url
    assert_selector "h1", text: "Posts"
  end

  test "should create post" do
    visit news_posts_url
    click_on "New post"

    fill_in "Content", with: @news_post.content
    fill_in "Subject", with: @news_post.subject
    click_on "Create Post"

    assert_text "Post was successfully created"
    click_on "Back"
  end

  test "should update Post" do
    visit news_post_url(@news_post)
    click_on "Edit this post", match: :first

    fill_in "Content", with: @news_post.content
    fill_in "Subject", with: @news_post.subject
    click_on "Update Post"

    assert_text "Post was successfully updated"
    click_on "Back"
  end

  test "should destroy Post" do
    visit news_post_url(@news_post)
    click_on "Destroy this post", match: :first

    assert_text "Post was successfully destroyed"
  end
end
