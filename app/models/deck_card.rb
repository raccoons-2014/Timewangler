class DeckCard < ActiveRecord::Base
  belongs_to :hero_card
  belongs_to :deck
end
