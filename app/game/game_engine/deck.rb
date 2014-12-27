module GameEngine
  class Deck
    attr_reader :list
    def initialize(deck_data)
      @list = deck_data.cards.map { |card| GameEngine::Card.new(card) }
    end

    def shuffle
      list.shuffle!
    end
  end
end
