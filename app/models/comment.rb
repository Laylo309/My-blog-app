class Comment < ApplicationRecord
  belongs_to :user, :post
# A method that updates the comments counter for a post.
  def update_comments_counter(id,comment)
    Post.find(id).update(comments_counter :comment)
  end
end
