module GameEngine
  module GameRunner
    def self.resolve_round(game)
      @player_one = game.player_one
      @player_two = game.player_two

      calc_points
      reset_selections
    end

    def self.maxstat_nilcheck(player)
      maxstat_nilcheck = (player.selection.first.nil? ? 0 : player.selection.first.max_stat)
    end

    def self.damage
      maxstat_nilcheck(@player_one) - maxstat_nilcheck(@player_two)
    end

    def self.reset_selections
        @player_one.selection = []
        @player_two.selection = []
    end

    def self.calc_points
        @player_one.points += damage
        @player_two.points -= damage
    end
  end
end
