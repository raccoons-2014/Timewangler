class Round < ActiveRecord::Base

  belongs_to :game

  delegate :player_one, :to => :game, :allow_nil => true
  delegate :player_two, :to => :game, :allow_nil => true
end
