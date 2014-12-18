class User < ActiveRecord::Base
  has_secure_password
  validates :email, :format => { :with => /\A\w+[@]\w+[.]\w*[.]*\w{2,}/}


  has_many :matchups
  has_many :games, through: :matchups
end