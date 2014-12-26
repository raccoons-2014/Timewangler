module GameEngine
  class Game

    def initialize(game_data, starting_points)
      player_one_id = game_data.player_one_id
      player_one_cards = game_data.player_one.deck.cards
      player_one_points = starting_points

      player_two_id = game_data.player_two_id
      player_two_cards = game_data.player_two.deck.cards
      player_two_points = starting_points
    end
  end
end
