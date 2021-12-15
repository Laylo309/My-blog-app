class Comment < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  belongs_to :post
# A method that updates the comments counter for a post.
after_save :update_comments_count

private

def update_comments_count
  post.increment!(:comments_counter)
end

end
