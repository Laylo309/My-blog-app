class Comment < ApplicationRecord
  belongs_to :user, :post
end
