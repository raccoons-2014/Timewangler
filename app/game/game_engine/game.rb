module GameEngine
  GAME_RULES = { starting_points: 30, hand_size: 6, setup_time: 10, move_time: 30, resolution_time: 5 }

  class Game
    attr_reader :id, :player_one, :player_two, :round
    attr_accessor :phase, :time

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

    def next_round
      @round += 1
      time = Time.now
      phase = :move
    end

    def resolve_round
      played_cards = [player_one.selection.first, player_two.selection.first]
      damage = (played_cards[0].max_stat - played_cards[1].max_stat).abs

      return nil if damage == 0

      if played_cards[0].max_stat > played_cards[1].max_stat
        player_two.points -= damage
        player_one.points += damage
      else
        player_one.points -= damage
        player_two.points += damage
      end
    end

    def phase=(new_phase)
      @phase = new_phase
      time = Time.now
    end
  end
end
