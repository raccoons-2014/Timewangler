module GameEngine
  class Game
    def initialize(game_data, starting_points)
      player_one_id = game_data.player_one_id
      player_one_cards = game_data.player_one.deck.cards
      player_one_points = starting_points
      player_two_id = game_data.player_two_id
      player_two_cards = game_data.player_two.deck.cards
      player_two_points = starting_points
      game_id = game_data.id
      ::Round.create(round_number: 0, player_one_points: player_one_points, player_one_hand: nil, player_one_deck: nil, player_two_points: player_two_points, player_two_hand: nil, player_two_deck: nil, game_id: game_id, player_one_choice: nil, player_two_choice: nil)
    end
  end
end
