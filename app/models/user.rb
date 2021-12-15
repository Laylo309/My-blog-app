class User < ApplicationRecord
  has_many :posts, :comments, :likes, foreign_key: 'author_id'

  # A method that returns the 3 most recent posts for a given user.
  def recent_posts 
    User.order(created_at :asc).limit(3)
  end
end
