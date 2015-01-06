module GameEngine
  module GameResolver
    def self.resolve_round(game_state)
      @player_one = game_state.player_one
      @player_two = game_state.player_two

      calc_points
      reset_selections
      game_state.phase = :won if game_state.won?
    end

    def self.determine_maxstat(player)
      player.selection.first.nil? ? 0 : player.selection.first.max_stat
    end

    #if player one has a higher maxstat, the overall damage value returned is positive.  If player two has a higher maxstat, the overall damage value returned is negative.
    def self.damage
      determine_maxstat(@player_one) - determine_maxstat(@player_two)
    end

    #Calc_points should work when the damage value returned from damage above is negative (when player two has a higher maxstat) or positive (when player one has a higher maxstat).  (For example, consider that the subtraction of a negative value adds a positive value and the addition of negative value subtracts that value.)
    def self.calc_points
      @player_one.points += damage
      @player_two.points -= damage
    end

    def self.reset_selections
      @player_one.selection = []
      @player_two.selection = []
    end

    def self.deal_cards(game_state)
      player_one = game_state.player_one
      player_two = game_state.player_two

      until player_one.hand.size == GAME_RULES[:hand_size]
        player_one.hand << player_one.deck.list.pop
      end

      until player_two.hand.size == GAME_RULES[:hand_size]
        player_two.hand << player_two.deck.list.pop
      end
    end

  end
end
