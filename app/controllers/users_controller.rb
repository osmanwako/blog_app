class UsersController < ApplicationController
  before_action :authenticate_user!

  def start
    p current_user
    redirect_to users_path
  end

  def index
    @users = User.includes(:posts, :comments, :likes).all
  end

  def show
    @user = User.includes(:posts, :comments, :likes).find_by(id: params[:id])
    @posts = if @user
               @user.recent_posts
             else
               []
             end
  end
end
