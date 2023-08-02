require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  setup do
    @userone = users(:one)
    @usertwo = users(:two)
  end
  test 'User index page' do
    visit users_path
    assert_selector 'a', text: @userone.name
    assert_selector 'p', text: "Number of post #{@userone.posts_counter}"
    assert 'avator.png', @userone.photo

    assert_selector 'a', text: @usertwo.name
    assert_selector 'p', text: "Number of post #{@usertwo.posts_counter}"
    assert 'avator.png', @usertwo.photo
    click_link @userone.name, match: :first
    assert user_path(@userone)
  end

  test 'User show page' do
    visit user_path(@usertwo)
    assert 'avator.png', @usertwo.photo
    assert_selector 'a', text: @usertwo.name
    assert_selector 'p', text: "Number of post #{@usertwo.posts_counter}"
    assert_selector 'p', text: @usertwo.bio
    assert @usertwo.recent_posts.count <= 3
    @usertwo.recent_posts.each do |post|
      assert_selector 'a', text: post.title
    end
    assert_selector 'a', text: 'See all Posts'
    click_link 'See all Posts'
    assert user_posts_path(@usertwo)
    visit user_path(@usertwo)
    post = @usertwo.recent_posts[0]
    assert_selector 'a', text: post.title
    click_link post.title, match: :first
    assert user_post_path(@usertwo, post)
  end
end
