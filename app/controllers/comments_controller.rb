class CommentsController < ApplicationController
  before_action :authenticate_user!
  # load_and_authorize_resource

  def create
    post = Post.find(params[:post_id])
    message = comment_params
    @comment = Comment.create(user: current_user, post:, text: message[:text])
    @comment.save
    @comment.update_comments_counters
    # render json: @comment
    redirect_to user_post_url(current_user, post)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    @post.comments_counter -= 1
    @post.save
    @comment.destroy
    redirect_to user_post_path(@post.author, @post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
