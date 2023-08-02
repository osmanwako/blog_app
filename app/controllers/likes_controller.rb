class LikesController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @likes = Like.where(user_id: current_user.id, post_id: @post.id).first
    unless @likes
      @like = Like.create(user: current_user, post: @post)
      @like.save
      @like.update_likes_counters
    end
    redirect_to user_post_url(@post.user, @post)
  end
end
