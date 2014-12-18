class Game < ActiveRecord::Base
has_many :matchups
has_a :winner, class_name: "User", through: :matchups
has_a :loser, class_name: "User", through: :matchups
end