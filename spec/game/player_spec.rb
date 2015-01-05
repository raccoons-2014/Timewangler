require 'rails_helper'


describe 'GameEngine::Player' do
  before(:each) { @player = GameEngine::Player.new(create(:deck).user) }

  describe '#new' do
    it 'should create a new Player instance without errors when passed an ActiveRecord User' do
      expect{ GameEngine::Player.new(create(:deck).user) }.to_not raise_error
    end
  end

  describe '#play_cards' do
    before(:each) do
      6.times { @player.hand << @player.deck.list.pop }
    end

    it 'should decrease the number of cards that are in a hand' do
      @player.play_cards([1])
      expect(@player.hand.size).to eq GameEngine::GAME_RULES[:hand_size] - 1
    end

    it 'should play the correct card from a hand' do
      selected_card = @player.hand[3]
      @player.play_cards([3])
      expect(@player.selection.first).to eq selected_card
    end
  end
end
