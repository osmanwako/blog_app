class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_comments_counters
    comments = Comment.where(post_id:)
    post.update(comments_counter: comments.count)
  end
end
