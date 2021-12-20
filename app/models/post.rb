class Post < ApplicationRecord
  belongs_to :user, class_name: :User, foreign_key: 'author_id'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  after_save :update_posts_counter
  validates :title, presence: true
  validates :text, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than: 0 }


    # A method that updates the posts counter for a user.
  def update_posts_counter
    user.increment!(:posts_counter)
  end

   # A method that returns the 5 most recent posts for a given post.
  def recent_comments
   comments.order(created_at: :desc).limit(5)
  end
end
