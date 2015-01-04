class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

# To Implement: Means of making these tools for Developers only for making and updating cards.
  def create
    @card = Card.new(card_params)

    if @card.save
      redirect_to card_path(@card)
    else
      flash[:error] = @card.errors.full_messages.join(", ")
      redirect_to new_card_path
    end
  end


  def show
    @card = Card.find(params[:id])
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    if @card.update_attributes(card_params)
      redirect_to card_path(@card)
    else
      render :edit
    end
  end

private
  def card_params
    params.require(:card).permit(:card_type, :name, :description, :strength, :intelligence, :charisma, :time_period, :picture_url)
  end
end