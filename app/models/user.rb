class User < ActiveRecord::Base
  has_secure_password
  has_many :matchups
  has_many :games, through: :matchups
end