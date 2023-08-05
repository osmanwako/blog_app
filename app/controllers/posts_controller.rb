class PostsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @user = User.includes(:posts, :comments, :likes).find_by(id: params[:user_id])
    @posts = @user.posts.includes(:comments, :likes)
  end

  def show
    @user = User.includes(:posts, :comments, :likes).find_by(id: params[:user_id])
    @post = @user.posts.find(params[:id])
    @comment = Comment.new
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    post = post_params
    @post = Post.create(author: current_user, title: post[:title], text: post[:text])
    @post.save
    @post.update_posts_counters
    redirect_to user_post_path(current_user, @post)
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @post.destroy
    @user.posts_counter -= 1
    @user.save
    redirect_to user_posts_path(@user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
