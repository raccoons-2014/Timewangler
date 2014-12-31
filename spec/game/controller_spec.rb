require 'rails_helper'

describe 'GameEngine::Controller' do
  describe '#advance_game' do
    before(:each) do
      @game_db_model = create(:game)
      @game_db_model.player_one.deck = create(:deck)
      @game_db_model.player_two.deck = create(:deck)

      game = GameEngine::Game.new(@game_db_model)
      @game_setup = game.dup; @game_setup.phase = :setup
      @game_move = game.dup; @game_move.phase = :move
      @game_resolution = game.dup; @game_resolution.phase = :resolution

    end

    it 'should be in a setup phase if not enough time has passed to proceed to the first move phase' do
      @game_setup.time = Time.now
      GameEngine::Cache.save_game_state(@game_setup)
      expect(GameEngine::Controller.advance_game(@game_db_model, @game_setup.player_one.id)[:phase]).to eq :setup
    end

    it 'should proceed to move phase if the current time is past the alloted setup time' do
      @game_setup.time = Time.now - GameEngine::GAME_RULES[:setup_time]
      GameEngine::Cache.save_game_state(@game_setup)
      expect(GameEngine::Controller.advance_game(@game_db_model, @game_setup.player_one.id)[:phase]).to eq :move
    end
  end
end
