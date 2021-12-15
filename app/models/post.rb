class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, :likes, foreign_key: 'post_id'

  # A method that updates the posts counter for a user.
  def update_posts_counter(id,post)
    User.find(id).update(posts_counter :post)
  end
    # A method that returns the 5 most recent posts for a given post.
    def comments 
    User.order(created_at :asc).limit(5)
  end
end
