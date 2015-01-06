class GamesController < ApplicationController
  include GameHelper

  def new
  end

  def show
    @game = Game.find(params[:id])
    new_game_data = GameEngine::GameState.new(@game)
    new_game_data.player_one.deck.shuffle
    new_game_data.player_two.deck.shuffle
    # GameEngine::Cache.save_game_state(new_game_data)
    GameEngine::Cache.save_game_state(new_game_data, Rails.cache)

    respond_to do |format|
      format.html { render 'show' }
    end
  end

  def poll
    p "*****"
    # p Hola.hi
    # p GAME_RULES


    @game = Game.find(params[:game_id])
    response = GameEngine::Controller.advance_game(@game, session[:user_id], Rails.cache)

    respond_to do |format|
      format.js { render :json => response.to_json }
    end
  end

  def index
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    render :json => "match destroyed".to_json
  end

  def join
    @user = User.find(session[:user_id])
    if @user.deck == nil
      flash[:error] = "You need to have a deck! You can make one starting here though."
      redirect_to new_deck_path
    elsif @user.deck.playable_deck? == false
      flash[:error] = "You can't play the game without a valid deck! It needs to have at least 30 cards"
      redirect_to deck_path(@user.deck)
    else
      if open_games?
        @game = open_games.first
        @game.update_attributes(player_two: @user)
        redirect_to game_path(@game)
      else
        @game = Game.create(player_one: @user)
        redirect_to "/games/#{@game.id}/matching"
      end
    end
  end

  def move
    card_id = params[:card].to_i

    p "***** card id"
    puts card_id

    game_data = Game.find(params[:game_id])

    GameEngine::Controller.get_player_move(game_data, session[:user_id].to_i, card_id, Rails.cache)

    respond_to do |format|
      format.js { render :json => "request for card #{card_id} processed".to_json }
    end
  end

  def matching
  end

  def status
    @game = Game.find(params[:game_id])

    respond_to do |format|
      if match_found?(@game)
        format.js { render :json => { url: "/games/#{@game.id}" }.to_json }
      else
        format.js { render :json => nil.to_json }
      end
    end
  end


end
