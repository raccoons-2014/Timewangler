class User < ActiveRecord::Base
  has_secure_password

  has_many :decks
  has_many :games, foreign_key: :player_one_id
  has_many :games, foreign_key: :player_two_id

  validates :password, :presence => true, :length => { :within => 4..40 }
  validates :username, :presence => true, :length => { :within => 4..40 }
end
