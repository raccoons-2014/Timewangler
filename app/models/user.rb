class User < ActiveRecord::Base
  has_secure_password

  has_many :games, foreign_key: :player_one_id
  has_many :games, foreign_key: :player_two_id

  validates :email, :format => { :with => /\A\w+[@]\w+[.]\w*[.]*\w{2,}/}
end
