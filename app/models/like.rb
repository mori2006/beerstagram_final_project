class Like < ApplicationRecord

  belongs_to :user

  belongs_to :beer

  validates :user_id, :presence => true, :uniqueness => { :scope => :beer_id }

  validates :beer_id, :presence => true

end
