class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, :likes, foreign_key: 'post_id'
end
