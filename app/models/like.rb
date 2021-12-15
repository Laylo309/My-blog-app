class Like < ApplicationRecord
  belongs_to :user, :post

  def update_likes_counter(id,like)
    Post.find(id).update(likes_counter :like)
  end
end
