module GameEngine
  GAME_RULES = { starting_points: 30, hand_size: 6 }

  class Game
    attr_reader :id, :player_one_points, :player_two_points, :player_one, :player_two

    def initialize(game_data)
      @game_data = game_data
      @id = game_data.id
      @player_one = GameEngine::Player.new(game_data.player_one)
      @player_two = GameEngine::Player.new(game_data.player_two)

      @player_one_points = GAME_RULES[:starting_points]
      @player_one_deck = GameEngine::Deck.new(game_data.player_one.deck)
      @player_one_hand = []

      @player_two_points = GAME_RULES[:starting_points]
      @player_two_deck = GameEngine::Deck.new(game_data.player_two.deck)
      @player_two_hand = []

    end


    def deal_cards
      until player_one.hand.size == GAME_RULES[:hand_size]
        player_one.hand << player_one.deck.list.pop
      end

      until player_two.hand.size == GAME_RULES[:hand_size]
        player_two.hand << player_two.deck.list.pop
      end
    end


    def play_round
      parser = Parser.new(@game_data, player_one, player_two, player_one_points, player_two_points)
      parser.save_round
    end

  end
end
