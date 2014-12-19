class DecksController < ApplicationController
# Make an instance of the deck class at the beginning of each game
# shuffle that deck once before play
# to draw a card, pop off of that deck


#Make a method to replenish the hand to have 6 cards at the beginning of each turn
  @player_1 = User.find(1)
  @player_2 = User.find(2)

  def prepare_player_deck(player)
    # deck = Deck.find(player.id)
    deck = Deck.find(user: player)
    deck = deck.shuffle
  end



end
