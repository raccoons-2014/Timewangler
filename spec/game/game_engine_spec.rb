require 'rails_helper'

describe 'Game Engine' do
  describe "GameEngine::Game" do

    before :each do
      @game_db_model = create(:game)
      @game_db_model.player_one.deck = create(:deck)
      @game_db_model.player_two.deck = create(:deck)

      @game = GameEngine::Game.new(@game_db_model)
    end

    describe '#new' do
      it 'should create a new Game instance without errors when passed an ActiveRecord model' do
        expect{ GameEngine::Game.new(@game_db_model) }.to_not raise_error
      end

      it 'should create a Game with decks that are instances of GameEngine::Deck' do
        expect(@game.player_one_deck.class).to eq GameEngine::Deck
        expect(@game.player_two_deck.class).to eq GameEngine::Deck
      end

      it 'should create a Game where players have maximum points at the start' do
        expect(@game.player_one_points).to eq GameEngine::GAME_RULES[:starting_points]
        expect(@game.player_two_points).to eq GameEngine::GAME_RULES[:starting_points]
      end
    end

    describe '#deal_cards' do
      before(:each) {   @game.deal_cards }

      it 'should give both players a maximum hand size after the first draw' do
        expect(@game.player_one_hand.size).to eq GameEngine::GAME_RULES[:hand_size]
        expect(@game.player_two_hand.size).to eq GameEngine::GAME_RULES[:hand_size]
      end

      it "should reduce both player's decks by the hand size" do
        expect(@game.player_one_deck.list.size).to eq @game_db_model.player_one.deck.cards.size - GameEngine::GAME_RULES[:hand_size]
        expect(@game.player_one_deck.list.size).to eq @game_db_model.player_two.deck.cards.size - GameEngine::GAME_RULES[:hand_size]
      end

      it 'should have two hands of GameEngine::Card objects' do
        expect(@game.player_one_hand.all? { |card| card.instance_of? GameEngine::Card }).to eq true
        expect(@game.player_two_hand.all? { |card| card.instance_of? GameEngine::Card }).to eq true
      end

    end
  end

  describe "GameEngine::Deck" do
    #..
  end

end
