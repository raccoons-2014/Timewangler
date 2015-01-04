class DecksController < ApplicationController
  def index
    user = User.find(session[:user_id])
    @deck = user.deck
  end

  def new
    @deck = Deck.new
  end

  def create
    user = User.find(session[:user_id])

    if user.deck != nil
      flash[:error] = "You already have a deck!"
      redirect_to profile_path
    else
      # Fun fact: When something has a has_one association, you need to use a different syntax for build!
      @deck = user.build_deck(deck_params)

      if @deck.save
        redirect_to profile_path
      else
        flash[:error] = @deck.errors.full_messages.join(", ")
        redirect_to new_deck_path
      end
    end
  end

  def show
    @deck = Deck.find(params[:id])
  end

  def edit
    @deck = Deck.find(params[:id])
  end

  def update
    @deck = Deck.find(params[:id])
    if @deck.update_attributes(deck_params)
      redirect_to deck_path(@deck)
    else
      render :edit
    end
  end


  def destroy
    user = User.find(session[:user_id])
    deck = user.deck
    deck.destroy
    redirect_to profile_path
  end

  def add_card(card_collection, card)
  end

  def remove_card(card_collection, card)
  end

# Do we still need this?
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
