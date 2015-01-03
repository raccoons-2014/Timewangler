class DecksController < ApplicationController
  def new
    @deck = Deck.new
  end

  def create
    user = User.find(session[:user_id])
    # So, at the moment, a User can only have One deck. Does it really need to be that way?
    @deck = user.decks.new deck_params

    if @deck.save
      redirect_to profile_path
    else
      flash[:error] = @deck.errors.full_messages.join(", ")
      redirect_to new_deck_path
    end
  end

  def deck1
    @deck1 = Card.all.shuffle[1..15]
    render :json => @deck1.to_json
  end

  def deck2
    @deck2 = Card.all.shuffle[1..15]
    render :json => @deck2.to_json
  end

  private
    def deck_params
      params.require(:deck).permit(:name)
    end

end
