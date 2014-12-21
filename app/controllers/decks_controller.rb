class DecksController < ApplicationController


  def deck1
    @deck1 = Card.all.shuffle[1..15]
    render :json => @deck1.to_json
  end

  def deck2
    @deck2 = Card.all.shuffle[1..15]
    render :json => @deck2.to_json
  end


end
