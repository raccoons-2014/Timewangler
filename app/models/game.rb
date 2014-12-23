class Game < ActiveRecord::Base
  belongs_to :player_one, class_name: "User"
  belongs_to :player_two, class_name: "User"
  belongs_to :winner, class_name: "User"

  has_many :rounds
end
