module GameEngine
  GAME_RULES = { starting_points: 30, hand_size: 6 }

  class Game
    attr_reader :player_one_points, :player_one_deck, :player_one_hand, :player_two_points, :player_two_deck, :player_two_hand

    def initialize(game_data)
      @player_one_points = GAME_RULES[:starting_points]
      @player_one_deck = GameEngine::Deck.new(game_data.player_one.deck.cards)
      @player_one_hand = []

      @player_two_points = GAME_RULES[:starting_points]
      @player_two_deck = GameEngine::Deck.new(game_data.player_two.deck.cards)
      @player_two_hand = []
    end

    def deal_cards
      until player_one_hand.size == GAME_RULES[:hand_size]
        player_one_hand << player_one_deck.list.pop
      end

      until player_two_hand.size == GAME_RULES[:hand_size]
        player_two_hand << player_two_deck.list.pop
      end
    end


  end
end
