class Comment < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  belongs_to :post

  after_save :update_comments_counter
  after_destroy :destroy_comments_counter

  def update_comments_counter
    post.increment!(:comments_counter)
  end

  def destroy_comments_counter
    post.decrement!(:comments_counter)
  end

end
