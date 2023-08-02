class UsersController < ApplicationController
  def index
    @users = User.includes(:posts, :comments, :likes).all
    return if @users.exists?

    @one = User.create(name: 'Osman', bio: 'Lecturer at JIT', photo: '')
    @one.save
    @two = User.create(name: 'Vanina', bio: 'Lecturer at MIT', photo: '')
    @two.save
    @users = User.includes(:posts, :comments, :likes).all
  end

  def show
    @user = User.includes(:posts, :comments, :likes).find(params[:id])
    @posts = @user.recent_posts
  end
end
