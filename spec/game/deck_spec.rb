require 'rails_helper'
require 'spec_helper'

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
