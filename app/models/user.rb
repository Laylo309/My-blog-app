class User < ApplicationRecord
  has_many :posts, :comments, :likes, foreign_key: 'author_id'
end
