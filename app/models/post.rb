class Post < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  has_many :comments
  has_many :likes
  after_save :update_posts_counter
  # A method that updates the posts counter for a user.
  def update_posts_counter
   user.increment!(:posts_counter)
  end

  # A method that returns the 5 most recent posts for a given post.
  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
