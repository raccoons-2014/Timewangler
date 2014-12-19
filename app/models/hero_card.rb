class HeroCard < ActiveRecord::Base
  belongs_to :time_period
  has_many :deck_card_relationships
  has_many :decks, through: :deck_card_relationships
end
