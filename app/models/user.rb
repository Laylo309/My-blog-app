class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  # A method that returns the 3 most recent posts for a given user.
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
