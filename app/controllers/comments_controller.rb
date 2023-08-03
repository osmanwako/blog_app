class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    message = comment_params
    @comment = Comment.create(user: current_user, post:, text: message[:text])
    @comment.save
    @comment.update_comments_counters
    redirect_to user_post_url(current_user, post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
