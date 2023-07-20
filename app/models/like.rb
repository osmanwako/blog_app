class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_likes_counters
    likes = Like.where(post_id:)
    post.update(likes_counter: likes.count)
  end
end
