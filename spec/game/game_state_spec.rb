require 'rails_helper'


describe "GameEngine::GameState" do

  before :each do
    @game_db_model = create(:game)
    @game_db_model.player_one.deck = create(:deck)
    @game_db_model.player_two.deck = create(:deck)

    @game_state = GameEngine::GameState.new(@game_db_model)
  end

  describe '#new' do
    it 'should create a new Game instance without errors when passed an ActiveRecord model' do
      expect{ GameEngine::GameState.new(@game_db_model) }.to_not raise_error
    end

    it 'should create a Game with decks that are instances of GameEngine::Deck' do
      expect(@game_state.player_one.deck.class).to eq GameEngine::Deck
      expect(@game_state.player_two.deck.class).to eq GameEngine::Deck
    end

    it 'should create a Game where players have maximum points at the start' do
      expect(@game_state.player_one.points).to eq GameEngine::GAME_RULES[:starting_points]
      expect(@game_state.player_two.points).to eq GameEngine::GAME_RULES[:starting_points]
    end
  end

  describe '#won? and #winner' do
    it 'should have neither player as the winner if both have health above 0' do
      @game_state.player_one.points -= 5
      @game_state.player_one.points += 5
      expect(@game_state.won?).to eq false
      expect(@game_state.winner).to eq nil
    end

    it "should declare player one the winner if their points are over 0 and player two's points are below zero" do
      @game_state.player_two.points -= 40
      @game_state.player_one.points += 40
      expect(@game_state.won?).to eq true
      expect(@game_state.winner).to eq @game_state.player_one
    end

    it "should declare player two the winner if their points are over 0 and player one's points are below zero" do
      @game_state.player_one.points -= 31
      @game_state.player_two.points += 31
      expect(@game_state.won?).to eq true
      expect(@game_state.winner).to eq @game_state.player_two
    end
  end
end
