class Game < ActiveRecord::Base
belongs_to :player_one, class_name: "User", foreign_key: :player_one_id
belongs_to :player_two, class_name: "User", foreign_key: :player_two_id
has_one :winner, class_name: "User", foreign_key: :winner_id
end