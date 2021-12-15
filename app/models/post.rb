class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  # A method that updates the posts counter for a user.
  def update_posts_counter(id, _post)
    User.find(id).update(posts_counter(:post))
  end

  # A method that returns the 5 most recent posts for a given post.
  def comments
    User.order(created_at(:asc)).limit(5)
  end
end
