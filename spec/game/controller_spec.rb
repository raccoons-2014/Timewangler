require 'rails_helper'

describe 'GameEngine::Controller' do
  describe '#advance_game' do
    before(:each) do
      game_db_model = create(:game)
      game_db_model.player_one.deck = create(:deck)
      game_db_model.player_two.deck = create(:deck)

      game = GameEngine::Game.new(game_db_model)
      @game_setup = game.dup; @game_setup.phase = :setup
      @game_move = game.dup; @game_setup.phase = :move
      @game_resolution = game.dup; @game_setup.phase = :resolution

    end

    xit 'resolve a move phase correctly' do
      #..
    end
  end
end
