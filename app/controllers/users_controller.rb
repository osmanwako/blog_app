class UsersController < ApplicationController
  def index
    @users = User.all
    unless (@users.exists?)
      @one = User.create(name: "Osman", bio: "Lecturer at JIT", photo: "")
      @one.save
      @two = User.create(name: "Vanina", bio: "Lecturer at MIT", photo: "")
      @two.save
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.recent_posts
  end
end
