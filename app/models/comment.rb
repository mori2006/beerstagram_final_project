class Comment < ApplicationRecord

  belongs_to :beer

  belongs_to :user

  validates :user_id, :presence => true

  validates :beer_id, :presence => true

  validates :body, :presence => true

end
