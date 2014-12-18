class Match < ActiveRecord::Base
  has_one :player1, class_name: "User"
  has_one :player2, class_name: "User"
  has_one :winner, class_name: "User"
end