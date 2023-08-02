class PostsController < ApplicationController
  def index
    @user = User.includes(:posts, :comments, :likes).find(params[:user_id])
  end

  def show
    @user = User.includes(:posts, :comments, :likes).find(params[:user_id])
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

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
