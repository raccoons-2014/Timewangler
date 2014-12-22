class Card < ActiveRecord::Base
  has_many :deck_card_relationships
  has_many :decks, through: :deck_card_relationships
end