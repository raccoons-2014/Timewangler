module GameEngine
  module Controller
    def self.advance_game(game_data, player_id)
      game_state = GameEngine::Cache.fetch_game_state(game_data)
      current_time = Time.now

      case game_state.phase
      when :setup
        if current_time - game_state.time >= GameEngine::GAME_RULES[:setup_time]
          game_state.phase = :move
          GameEngine::Cache.save_game_state(game_state)
          GameEngine::IO.output_player_data(game_state, player_id)
        else
          GameEngine::IO.output_player_data(game_state, player_id)
        end
      when :move
        game_state.deal_cards

        if current_time - game_state.time >= GameEngine::GAME_RULES[:move_time]
          game_state.phase = :resolution
          GameEngine::Cache.save_game_state(game_state)
          GameEngine::IO.output_player_data(game_state, player_id)
        else
          GameEngine::Cache.save_game_state(game_state)
          GameEngine::IO.output_player_data(game_state, player_id)
        end
      when :resolution
        # Kinda broken, one client stuck in resolution phase forever while second never hits
        if current_time - game_state.time >= GameEngine::GAME_RULES[:resolution_time]
          game_state.phase = :move
          game_state.round += 1
          GameEngine::Cache.save_game_state(game_state)
          GameEngine::IO.output_player_data(game_state, player_id)
        else
          GameEngine::IO.output_player_data(game_state, player_id)
        end
      end
    end
  end
end
