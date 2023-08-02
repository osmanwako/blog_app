require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @userone = users(:one)
    @usertwo = users(:two)
    @postone = posts(:pone)
    # @posttwo = posts(:ptwo)
  end
  test "Post index page" do
    visit user_posts_path(@userone)
    assert "avator.png", @userone.photo
    assert_selector "a", text: @userone.name
    assert_selector "p", text: "Number of post #{@userone.posts_counter}"

    @userone.posts.each do |post|
      assert_selector "a", text: post.title
      assert_selector "p", text: post.text
      assert_selector "span", text: post.comments.first.text
      assert_selector "span", text: post.comments_counter
      assert_selector "span", text: post.likes_counter
    end
    assert_selector "a", text: "Pagination"
    click_link @userone.posts.first.title, match: :first
    assert current_path = user_post_path(@userone, @userone.posts.first)
  end

  test "post show page" do
    visit user_post_path(@usertwo, @usertwo.posts.first)
    assert_selector "strong", text: @usertwo.name
    assert_selector "strong", text: @usertwo.posts.first.title
    assert_selector "span", text: @usertwo.posts.first.comments_counter
    assert_selector "span", text: @usertwo.posts.first.likes_counter
    assert_selector "p", text: @usertwo.posts.first.text
    @usertwo.posts.first.comments.each do |comment|
      assert_selector "span", text: comment.user.name
      assert_selector "span", text: comment.text
    end
  end
end
