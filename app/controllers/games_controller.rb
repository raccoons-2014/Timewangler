class GamesController < ApplicationController
  include GameHelper

  def new
  end

  def show
    @game = Game.find(params[:id])



    new_game_data = GameEngine::Game.new(@game)
    GameEngine::Cache.save_game_state(new_game_data)

    @game_data = {id: @game.id, player_one_id: @game.player_one_id, player_two_id: @game.player_two_id}

    @game_data = @game



    #So I added code in GameEngine::Game and in the new model GameEngine::Parser. I chose here as the place to call that code for my testing purposed but you might want to have it somewhere else, this was just so I could see things easily. I also added a lot of code to show.html so that I could see the outputs of things easily.

    @game_engine = GameEngine::Game.new(@game)
    @game_engine.deal_cards
    @game_engine.play_round


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
