require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @userone = users(:one)
    @usertwo = users(:two)
    @postone = posts(:pone)
    @posttwo = posts(:ptwo)
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
    click_link @postone.title, match: :first
    assert_selector "strong", text: @postone.title
    assert_equal(current_path, user_post_path(@userone, @postone))
  end

  test "post show page" do
    visit user_post_path(@usertwo, @posttwo)
    assert_selector "strong", text: @usertwo.name
    assert_selector "strong", text: @posttwo.title
    assert_selector "span", text: @posttwo.comments_counter
    assert_selector "span", text: @posttwo.likes_counter
    assert_selector "p", text: @posttwo.text
    @posttwo.comments.each do |comment|
      assert_selector "span", text: comment.user.name
      assert_selector "span", text: comment.text
    end
  end
end
