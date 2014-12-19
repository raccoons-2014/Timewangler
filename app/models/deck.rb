class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :deck_card_relationships
  has_many :hero_cards, through: :deck_card_relationships

  def create_shuffled_deck
    HeroCard.all.shuffle[1..15]
  end
end