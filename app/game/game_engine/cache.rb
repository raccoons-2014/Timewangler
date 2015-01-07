module GameEngine
  module Cache
    def self.save_game_state(game, caching_interface)
      caching_interface.write "#{game.id}#{game.player_one.id}#{game.player_two.id}", game
    end

    def self.fetch_game_state(game_data, caching_interface)
      caching_interface.read "#{game_data.id}#{game_data.player_one.id}#{game_data.player_two.id}"
    end

    def self.clear_game_state(game_data, caching_interface)
      caching_interface.delete "#{game_data.id}#{game_data.player_one.id}#{game_data.player_two.id}"
    end
  end
end
