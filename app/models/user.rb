class User < ActiveRecord::Base
  has_many :games, foreign_key: :player_one_id
  has_many :games, foreign_key: :player_two_id
end
