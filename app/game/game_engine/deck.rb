module GameEngine
  class Deck
    attr_reader :list
    def initialize(cards)
      @list = cards.map { |card| GameEngine::Card.new(card) }
    end

    def shuffle
      list.shuffle!
    end
  end
end
