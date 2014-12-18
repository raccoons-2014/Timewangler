class HeroCard < ActiveRecord::Base
  belongs_to :time_period

  has_many :deck_cards
  has_many :decks, through: :deck_cards
end
