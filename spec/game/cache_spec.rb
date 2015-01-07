require 'rails_helper'
require 'spec_helper'

describe "GameEngine::Cache" do
  let(:game_data) { game_data = create(:game) }

  let(:game) do
    game_data.player_one.deck = create(:deck)
    game_data.player_two.deck = create(:deck)

    GameEngine::GameState.new(game_data)
  end

  describe '#save_game_state' do
    it 'does not return false after saving game data' do
      expect(GameEngine::Cache.save_game_state(game, Rails.cache)).to_not eq false
    end
  end

  describe '#fetch_game_state' do
    it 'returns the correct object' do
      GameEngine::Cache.save_game_state(game, Rails.cache)
      expect(GameEngine::Cache.fetch_game_state(game_data, Rails.cache).id).to eq game.id
    end
  end

  describe '#clear_game_state' do
    it 'deletes the correct object from the cache' do
      GameEngine::Cache.save_game_state(game, Rails.cache)
      expect(GameEngine::Cache.fetch_game_state(game_data, Rails.cache)).to_not eq nil
      GameEngine::Cache.clear_game_state(game_data, Rails.cache)
      expect(GameEngine::Cache.fetch_game_state(game_data, Rails.cache)).to eq nil
    end
  end
end
