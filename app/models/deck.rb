class Deck < ActiveRecord::Base
  belongs_to :user

  has_many :deck_cards
  has_many :hero_cards, through: :deck_cards
end
