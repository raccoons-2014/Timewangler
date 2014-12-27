module GameEngine
  class Player
    attr_reader :id, :deck, :hand, :selection, :points

    def initialize(player_data)
      @id = player_data.id
      @deck = GameEngine::Deck.new(player_data.deck)
      @hand = []
      @selection = []
      @points = GAME_RULES[:starting_points]
    end

    def select_card(index)

    end
  end
end
