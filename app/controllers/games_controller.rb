class GamesController < ApplicationController
  include GameHelper

  def new
  end

  def show
    @game = Game.find(params[:id])

    new_game_data = GameEngine::Game.new(@game)
    GameEngine::Cache.save_game_state(new_game_data)

    # uncomment these if you want to see how the parse works:
    # @game_engine = new_game_data
    # @game_engine.deal_cards
    # @game_engine.play_round

    respond_to do |format|
      format.html { render 'show', :locals => { game_state: new_game_data }, :layout => !request.xhr? }
    end
  end

  def poll
    @game = Game.find(params[:game_id])

    respond_to do |format|
      format.js { render :json => GameEngine::Cache.output_player_data(@game, session[:user_id]).to_json }
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
