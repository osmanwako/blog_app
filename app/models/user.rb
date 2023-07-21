class User < ApplicationRecord
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :post, class_name: 'Post', foreign_key: 'author_id'
  has_many :comment
  has_many :like

  def recent_posts
    post.order(created_at: :desc).limit(3)
  end
end
