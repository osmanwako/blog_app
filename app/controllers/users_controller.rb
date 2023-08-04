class UsersController < ApplicationController
  before_action :authenticate_user!

  def start
    redirect_to users_path
  end

  def index
    @users = User.includes(:posts, :comments, :likes).all
  end

  def show
    @user = User.includes(:posts, :comments, :likes).find_by(id: params[:id])
    unless @user
      @posts = []
    else
      @posts = @user.recent_posts
    end
  end
end
