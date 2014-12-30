describe 'GameEngine::GameRunner' do
  describe '#resolve_round' do
    before(:each) do
      game_db_model = create(:game)
      game_db_model.player_one.deck = create(:deck)
      game_db_model.player_two.deck = create(:deck)

      @game = GameEngine::Game.new(game_db_model)

      @winning_card = GameEngine::Card.new(create :strong_card)
      @losing_card = GameEngine::Card.new(create :weak_card)

    end

    it 'should deduct the correct number of points from the losing player and add them to the winning player' do
      @game.player_one.selection << @winning_card
      @game.player_two.selection << @losing_card
      damage = (@winning_card.max_stat - @losing_card.max_stat)
      GameEngine::GameRunner.resolve_round(@game)
      expect(@game.player_two.points).to eq GameEngine::GAME_RULES[:starting_points] - damage
      expect(@game.player_one.points).to eq GameEngine::GAME_RULES[:starting_points] + damage
    end
  end
end
