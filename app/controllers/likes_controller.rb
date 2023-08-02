class LikesController < ApplicationController
  def index
    @post = Post.includes(:comments, :likes).find(params[:post_id])
    @likes = Like.where(user: current_user, post: @post).first
    unless @likes
      @like = Like.create(user: current_user, post: @post)
      @like.save
      @like.update_likes_counters
    end
    redirect_to user_post_path(@post.author, @post)
  end
end
