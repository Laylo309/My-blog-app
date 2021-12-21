class Post < ApplicationRecord
  belongs_to :user, class_name: :User, foreign_key: 'author_id'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  after_save :increment_counter
  validates :title, presence: true
  validates :text, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def increment_counter
    user.update(posts_counter: user.posts_counter + 1)
  end

  def recent_comments(limit = 5)
    comments.last(limit)
  end
end
