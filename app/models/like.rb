class Like < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  belongs_to :post
  after_save :increment_counter

  def increment_counter
    post.update(likes_counter: post.likes.count)
  end
end
