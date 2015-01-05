module GameEngine
  module GameRunner
    # -------------------------------------------------
    def self.maxstat_nilcheck(player)
      maxstat_nilcheck = (player.selection.first.nil? ? 0 : player.selection.first.max_stat)
    end

    def self.damage
      @max_stat_compare = maxstat_nilcheck(@player_one) - maxstat_nilcheck(@player_two)
      @max_stat_compare.abs
    end

    def self.reset_selections
        @player_one.selection = []
        @player_two.selection = []
    end

    def self.subtract_points(player)
        player.points -= damage()
    end

    def self.add_points(player)
        player.points += damage()
    end

    # -------------------------------------------------
    def self.resolve_round(game)

      @player_one = game.player_one
      @player_two = game.player_two
      @played_cards = [@player_one.selection.first, @player_two.selection.first]




      if @played_cards.include?(nil)
        if @played_cards.all? {|x| x.nil?}
          reset_selections
          # return nil
        elsif @played_cards[0].nil?
          subtract_points(@player_one)
          add_points(@player_two)
          reset_selections
        else
          subtract_points(@player_two)
          add_points(@player_one)
          reset_selections
        end
      elsif @played_cards[0].max_stat > @played_cards[1].max_stat
        subtract_points(@player_two)
        add_points(@player_one)
        reset_selections
      else
        subtract_points(@player_one)
        add_points(@player_two)
        reset_selections
      end
    end

  end
end
