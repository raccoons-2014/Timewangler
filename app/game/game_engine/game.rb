module GameEngine
  GAME_RULES = { starting_points: 30, hand_size: 6, setup_time: 10, move_time: 30, resolution_time: 5 }

  class Game
    attr_reader :id, :player_one, :player_two

    def initialize(game_data)
      @id = game_data.id
      @player_one = GameEngine::Player.new(game_data.player_one)
      @player_two = GameEngine::Player.new(game_data.player_two)
    end

    def deal_cards
      until player_one.hand.size == GAME_RULES[:hand_size]
        player_one.hand << player_one.deck.list.pop
      end

      until player_two.hand.size == GAME_RULES[:hand_size]
        player_two.hand << player_two.deck.list.pop
      end
    end


  end
end
