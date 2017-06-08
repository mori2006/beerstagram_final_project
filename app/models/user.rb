class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :beers

  has_many :comments

  has_many :likes

  has_many :liked_beers, :through => :likes, :source => :beer

  validates :username, :presence => true, :uniqueness => true

  validates :username, :presence => true, :uniqueness => true
end
