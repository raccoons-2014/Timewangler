class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :deck_card_relationships
  has_many :cards, through: :deck_card_relationships

  def create_shuffled_deck
    Card.all.shuffle[1..15]
  end

  def contains?(card)
    cards.include?(card)
  end
end
