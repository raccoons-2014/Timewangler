module GameEngine
  module Cache
    def self.save_game_state(game)
      Rails.cache.write "#{game.id}#{game.player_one.id}#{game.player_two.id}", game
    end

    def self.fetch_game_state(game_data)
      Rails.cache.read "#{game_data.id}#{game_data.player_one_id}#{game_data.player_two_id}"
    end

    def self.clear_game_state(game_data)
      Rails.cache.delete "#{game_data.id}#{game_data.player_one_id}#{game_data.player_two_id}"
    end

    def self.output_player_data(game_data, player_id)
      game_state = fetch_game_state(game_data)

      case player_id
      when game_state.player_one.id
        return { player: game_state.player_one, opponent_hand_size: game_state.player_two.deck.list.size }
      when game_state.player_two.id
        return { player: game_state.player_two, opponent_hand_size: game_state.player_one.deck.list.size }
      end
    end
  end
end
