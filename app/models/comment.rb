class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_comments_counters
    post.update(comments_counter: post.comments.count)
  end
end
