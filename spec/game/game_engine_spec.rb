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
        expect(@game.player_one.deck.class).to eq GameEngine::Deck
        expect(@game.player_two.deck.class).to eq GameEngine::Deck
      end

      it 'should create a Game where players have maximum points at the start' do
        expect(@game.player_one.points).to eq GameEngine::GAME_RULES[:starting_points]
        expect(@game.player_two.points).to eq GameEngine::GAME_RULES[:starting_points]
      end
    end

    describe '#deal_cards' do
      before(:each) {   @game.deal_cards }

      it 'should give both players a maximum hand size after the first draw' do
        expect(@game.player_one.hand.size).to eq GameEngine::GAME_RULES[:hand_size]
        expect(@game.player_two.hand.size).to eq GameEngine::GAME_RULES[:hand_size]
      end

      it "should reduce both player's decks by the hand size" do
        expect(@game.player_one.deck.list.size).to eq @game_db_model.player_one.deck.cards.size - GameEngine::GAME_RULES[:hand_size]
        expect(@game.player_one.deck.list.size).to eq @game_db_model.player_two.deck.cards.size - GameEngine::GAME_RULES[:hand_size]
      end

      it 'should have two hands of GameEngine::Card objects' do
        expect(@game.player_one.hand.all? { |card| card.instance_of? GameEngine::Card }).to eq true
        expect(@game.player_two.hand.all? { |card| card.instance_of? GameEngine::Card }).to eq true
      end
    end
  end

  describe "GameEngine::Cache" do
    let(:game_data) { game_data = create(:game) }

    let(:game) do
      game_data.player_one.deck = create(:deck)
      game_data.player_two.deck = create(:deck)

      GameEngine::Game.new(game_data)
    end

    describe '#save_game_state' do
      it 'does not return false after saving game data' do
        expect(GameEngine::Cache.save_game_state(game)).to_not eq false
      end
    end

    describe '#fetch_game_state' do
      it 'returns the correct object' do
        GameEngine::Cache.save_game_state(game)
        expect(GameEngine::Cache.fetch_game_state(game_data).class).to eq GameEngine::Game
      end
    end
  end

  describe "GameEngine::Deck" do
    let(:game_deck) { GameEngine::Deck.new(create(:deck)) }

    describe '#new' do
      it 'should create a new instance without errors when passed an ActiveRecord model' do
        expect{ GameEngine::Deck.new(create(:deck)) }.to_not raise_error
      end
    end

    describe '#list' do
      let(:game_deck) { GameEngine::Deck.new(create(:deck)) }
      it 'should return an array filled with GameEngine::Card objects' do
        expect(game_deck.list.all? { |card| card.instance_of? GameEngine::Card })
      end
    end

    describe '#shuffle' do
      let(:game_deck) { GameEngine::Deck.new(create(:deck)) }

      it 'should change the order of the deck' do
        sorted_deck = game_deck.list.dup
        game_deck.shuffle
        expect(game_deck.list[0..2]).to_not eq sorted_deck[0..2]
      end
    end
  end

end
