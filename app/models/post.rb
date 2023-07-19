class Post < ApplicationRecord
  belongs_to :user, foreign_key: "author_id"
  has_many :comment
  has_many :like
end
