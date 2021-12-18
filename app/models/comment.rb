class Comment < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  belongs_to :post

  after_save :increment_counter

  def increment_counter
    post.update(comments_counter: post.comments.count)
  end
end
