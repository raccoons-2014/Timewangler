module GameEngine
  class GameState
    attr_reader :id, :player_one, :player_two
    attr_accessor :round, :time, :phase

    def initialize(game_data)
      @id = game_data.id
      @player_one = GameEngine::Player.new(game_data.player_one)
      @player_two = GameEngine::Player.new(game_data.player_two)
      @round = 0
      @phase = :setup
      @time = Time.now
    end

    def target_player(player_id)
      return player_one if player_one.id.to_i == player_id.to_i
      return player_two if player_two.id.to_i == player_id.to_i
      raise ArgumentError.new("No player found with id = #{player_id}")
    end

    def winner
      return player_one if player_one.points > 0 && player_two.points <= 0
      return player_two if player_two.points > 0 && player_one.points <= 0
    end

    def won?
      winner != nil
    end
  end
end
