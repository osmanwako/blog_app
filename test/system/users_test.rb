require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    @user2 = users(:two)
  end

  test "visiting the index" do
    # user = User.create(name: "Osman", bio: "Lecture at Jit", photo: "")
    # user.save
    get "/users"
    assert_selector "h1", text: "Users"
  end
end
