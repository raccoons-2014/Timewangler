module GameEngine
  class Player
    attr_reader :id, :deck, :hand
    attr_accessor :points, :selection

    def initialize(player_data)
      @id = player_data.id
      @deck = GameEngine::Deck.new(player_data.deck)
      @hand = []
      @selection = []
      @points = GameEngine::GAME_RULES[:starting_points]
    end

    def play_cards(indexes)
      indexes.each { |i| selection << hand.delete_at(i) }
    end
  end
end
