class DecksController < ApplicationController
  def index
    user = User.find(session[:user_id])

    if user.deck != nil
      @deck = user.deck
    else
      flash[:error] = "You don't have a deck, but you can make one starting here!"
      redirect_to new_deck_path
    end
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
        redirect_to deck_path(@deck)
      else
        flash[:error] = @deck.errors.full_messages.join(", ")
        redirect_to new_deck_path
      end
    end
  end

  def show
    @deck = Deck.find(params[:id])
    @cards = Card.all
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
    # The refactor is known as: "REPLACE TEMPORARY VARIABLE WITH CHAINED METHOD
    # CALL"
    User.find(session[:user_id]).deck.destroy
    redirect_to profile_path
  end

  def add_card
    card = Card.find(params[:card_id])
    deck = User.find(session[:user_id]).deck

    if deck.contains?(@card)
      flash[:error] = "You already have this card in your deck!"
      redirect_to deck_path(user.deck)
    else
      deck << @card
      redirect_to deck_path(user.deck)
    end
  end

  def remove_card
    user = User.find(session[:user_id])
    cards_in_deck = user.deck.cards
    @card = Card.find(params[:card_id])
    cards_in_deck.delete(@card)
    redirect_to deck_path(user.deck)
  end

  private
    def deck_params
      params.require(:deck).permit(:name)
    end

end
