class Beer < ApplicationRecord

  belongs_to :user

  belongs_to :brewery

  has_many :comments

  has_many :likes

  has_many :fans, :through => :likes, :source => :user

  validates :user_id, :presence => true

  validates :name, :presence => true, :uniqueness => { :scope => :brewery_id }

  validates :image, :presence => true

  validates :brewery_id, :presence => true

  validates :rating, :numericality => { :only_integer => true, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 5,}

end
