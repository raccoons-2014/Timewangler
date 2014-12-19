class DecksController < ApplicationController
# Make an instance of the deck class at the beginning of each game
# shuffle that deck once before play
# to draw a card, pop off of that deck


  def deck1
    @deck1 = HeroCard.all.shuffle[1..15]
    render :json => @deck1.to_json
  end

  def deck2
    @deck2 = HeroCard.all.shuffle[1..15]
    render :json => @deck2.to_json
  end


end
