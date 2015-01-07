require 'rails_helper'
require 'spec_helper'

describe 'GameEngine::Controller' do
  caching_interface = Rails.cache

  describe '#advance_game' do
    before(:each) do
      @game_db_model = create(:game)
      @game_db_model.player_one.deck = create(:deck)
      @game_db_model.player_two.deck = create(:deck)

      game = GameEngine::GameState.new(@game_db_model)
      @game_setup = game.dup; @game_setup.phase = :setup
      @game_move = game.dup; @game_move.phase = :move
      @game_resolution = game.dup; @game_resolution.phase = :resolution

    end

    it 'should be in setup phase if it is not time for move phase' do
      @game_setup.time = Time.now
      GameEngine::Cache.save_game_state(@game_setup, caching_interface)
      expect(GameEngine::Controller.advance_game(@game_db_model, @game_setup.player_one.id, caching_interface)[:phase]).to eq :setup
    end

    it 'should proceed to move phase if time is over the alloted setup time' do
      @game_setup.time = Time.now - GameEngine::GAME_RULES[:setup_time]
      GameEngine::Cache.save_game_state(@game_setup, caching_interface)
      expect(GameEngine::Controller.advance_game(@game_db_model, @game_setup.player_one.id, caching_interface)[:phase]).to eq :move
    end

    it 'should be in move phase if it is not time for resolution phase' do
      @game_move.time = Time.now
      GameEngine::Cache.save_game_state(@game_move, caching_interface)
      expect(GameEngine::Controller.advance_game(@game_db_model, @game_move.player_one.id, caching_interface)[:phase]).to eq :move
    end

    it "should set player one's choice to nil if no choice is made and their request is recieved past alloted move time" do
      @game_move.time = Time.now - GameEngine::GAME_RULES[:move_time]
      GameEngine::Cache.save_game_state(@game_move, caching_interface)
      GameEngine::Controller.advance_game(@game_db_model, @game_move.player_one.id, caching_interface)
      expect(GameEngine::Cache.fetch_game_state(@game_db_model, caching_interface).player_one.selection).to eq [nil]
      expect(GameEngine::Cache.fetch_game_state(@game_db_model, caching_interface).player_two.selection).to eq []
    end

    it 'should set both choices to nil if it is time to proceed to resolution phase' do
      @game_move.time = Time.now - GameEngine::GAME_RULES[:move_time]
      GameEngine::Cache.save_game_state(@game_move, caching_interface)
      GameEngine::Controller.advance_game(@game_db_model, @game_move.player_one.id, caching_interface)
      GameEngine::Controller.advance_game(@game_db_model, @game_move.player_two.id, caching_interface)
      expect(GameEngine::Cache.fetch_game_state(@game_db_model, caching_interface).player_one.selection).to eq [nil]
      expect(GameEngine::Cache.fetch_game_state(@game_db_model, caching_interface).player_two.selection).to eq [nil]
    end

    it "should proceed to the resolution phase if both choices have been made" do
      @game_move.time = Time.now - GameEngine::GAME_RULES[:move_time]
      GameEngine::Cache.save_game_state(@game_move, caching_interface)
      GameEngine::Controller.advance_game(@game_db_model, @game_move.player_one.id, caching_interface)
      GameEngine::Controller.advance_game(@game_db_model, @game_move.player_two.id, caching_interface)
      expect(GameEngine::Cache.fetch_game_state(@game_db_model, caching_interface).phase).to eq :resolution
    end
  end
end
