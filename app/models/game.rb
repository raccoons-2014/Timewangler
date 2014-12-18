class Game < ActiveRecord::Base
has_many :matches, through: :players
has_many :players, class_name: "User"
end