class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', required: true
  has_many :comment
  has_many :like

  def update_posts_counters
    authors = Post.where(author_id:)
    author.update(posts_counter: authors.count)
  end

  def recent_comments
    comment.order(created_at: :desc).limit(5)
  end
end
