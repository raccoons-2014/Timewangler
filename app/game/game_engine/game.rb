module GameEngine
  class Game
    attr_reader :id, :player_one, :player_two, :phase
    attr_accessor :round, :time

    def initialize(game_data)
      @id = game_data.id
      @player_one = GameEngine::Player.new(game_data.player_one)
      @player_two = GameEngine::Player.new(game_data.player_two)
      @round = 0
      @phase = :setup
      @time = Time.now
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
