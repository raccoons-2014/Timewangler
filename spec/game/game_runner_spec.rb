require 'rails_helper'

describe 'GameEngine::GameRunner' do
  describe '#resolve_round' do
    before(:each) do
      game_db_model = create(:game)
      game_db_model.player_one.deck = create(:deck)
      game_db_model.player_two.deck = create(:deck)

      @game = GameEngine::Game.new(game_db_model)

      @winning_card = GameEngine::Card.new(create :strong_card)
      @losing_card = GameEngine::Card.new(create :weak_card)
      @starting_points = GameEngine::GAME_RULES[:starting_points]

    end

    it 'should set the players selections to nil when played cards for each is nil' do
      @game.player_one.selection[0] = nil
      @game.player_two.selection[0] = nil
      GameEngine::GameRunner.resolve_round(@game)
      expect(@game.player_one.selection).to eq []
      expect(@game.player_two.selection).to eq []
    end

    it 'should deduct the correct number of points from the losing player and add them to the winning player' do
      @game.player_one.selection << @winning_card
      @game.player_two.selection << @losing_card
      damage = (@winning_card.max_stat - @losing_card.max_stat)
      GameEngine::GameRunner.resolve_round(@game)
      expect(@game.player_two.points).to eq @starting_points - damage
      expect(@game.player_one.points).to eq @starting_points + damage
    end

    it 'should not deduct any points when both players chose to play no cards' do
      @game.player_one.selection << nil
      @game.player_two.selection << nil
      GameEngine::GameRunner.resolve_round(@game)
      expect(@game.player_two.points).to eq @starting_points
      expect(@game.player_one.points).to eq @starting_points
    end

    it 'should correctly assign points when one player does not play a card but the other does' do
      @game.player_one.selection << nil
      @game.player_two.selection << @winning_card
      GameEngine::GameRunner.resolve_round(@game)
      expect(@game.player_one.points).to eq @starting_points - @winning_card.max_stat
      expect(@game.player_two.points).to eq @starting_points + @winning_card.max_stat
    end
  end
end
