class User < ApplicationRecord
  has_many :post, class_name: 'Post', foreign_key: 'author_id'
  has_many :comment
  has_many :like

  def recent_posts
    post.order(created_at: :desc).limit(3)
  end
end
