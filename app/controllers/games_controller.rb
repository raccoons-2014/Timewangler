class GamesController < ApplicationController
  include GameHelper

  def new
  end

  def show
    @game = Game.find(params[:id])
    new_game_data = GameEngine::Game.new(@game)
    GameEngine::Cache.save_game_state(new_game_data)

    respond_to do |format|
      format.html { render 'show', :locals => { game_state: new_game_data }}
    end
  end

  def poll
    @game = Game.find(params[:game_id])
    response = GameEngine::Controller.advance_game(@game, session[:user_id])

    respond_to do |format|
      format.js { render :json => response.to_json }
    end
  end

  def index
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
  end

  def join
    @user = User.find(session[:user_id])

    if open_games?
      @game = open_games.first
      @game.update_attributes(player_two: @user)
      redirect_to game_path(@game)
    else
      @game = Game.create(player_one: @user)
      redirect_to "/games/#{@game.id}/matching"
    end
  end

  def move
    card_id = params[:card].to_i
    game_data = Game.find(params[:game_id])

    GameEngine::Controller.get_player_move(game_data, session[:user_id].to_i, card_id)
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
