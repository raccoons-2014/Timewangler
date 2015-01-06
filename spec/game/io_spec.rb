require 'rails_helper'

describe "GameEngine::IO" do

  before :each do
    @game_db_model = create(:game)
    @game_db_model.player_one.deck = create(:deck)
    @game_db_model.player_two.deck = create(:deck)
    @card = create(:card)
    @game_state = GameEngine::GameState.new(@game_db_model)
  end

  describe "GameEngine::IO#self.output_player_data" do
    it "returns the player's current hand, points, round, phase, and time remaining" do
      expect(GameEngine::IO.output_player_data(@game_state, @game_db_model.player_one.id)).to be_a Hash
    end
  end

  describe "GameEngine::IO#self.input_player_move" do
    it "sends a player's move to the server" do
      expect(GameEngine::IO.input_player_move(@game_state, @game_db_model.player_one.id, @card.id)[0]).to eq(@card.id)
    end
  end
end