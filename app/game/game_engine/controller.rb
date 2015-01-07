module GameEngine
  module Controller

    def self.save_game_state(game_state, caching_interface)
      GameEngine::Cache.save_game_state(game_state, caching_interface)
    end

    def self.fetch_game_state(game_data, caching_interface)
      GameEngine::Cache.fetch_game_state(game_data, caching_interface)
    end

    def self.update_game_state_time(game_state)
      game_state.time = Time.now
    end

    def self.output_player_data(game_state, player_id)
      GameEngine::IO.output_player_data(game_state, player_id)
    end

    def self.selection_made?(player)
      !player.selection.empty?
    end

    def self.updatetime_savegamestate_and_outputplayerdata(game_state, player_id, caching_interface)
      update_game_state_time(game_state)
      save_game_state(game_state, caching_interface)
      output_player_data(game_state, player_id)
    end

    def self.phase_time_check(game_state, time_input)
      Time.now - game_state.time >= GAME_RULES[time_input]
    end

    def self.both_players_moved?(game_state)
      selection_made?(game_state.player_one) && selection_made?(game_state.player_two)
    end

    def self.advance_game(game_data, player_id, caching_interface)
      # This method is responsible for switching phases inside of the GameEngine::Game
      # class when passed the ActiveRecord model of the game and the player_id for the
      # client that's making the request.
      game_state = GameEngine::Cache.fetch_game_state(game_data, caching_interface)
      current_time = Time.now

      current_player = game_state.target_player(player_id.to_i)
      player_one = game_state.player_one
      player_two = game_state.player_two

      case game_state.phase
      when :setup
        if phase_time_check(game_state, :setup_time)
          game_state.phase = :move
          GameEngine::GameResolver.deal_cards(game_state)
          updatetime_savegamestate_and_outputplayerdata(game_state, player_id, caching_interface)

        end
      when :move
        if phase_time_check(game_state, :move_time) && !selection_made?(current_player)
            current_player.selection << nil
            save_game_state(game_state, caching_interface)
            output_player_data(game_state, player_id)
        end

        if both_players_moved?(game_state)
          game_state.phase = :resolution
          updatetime_savegamestate_and_outputplayerdata(game_state, player_id, caching_interface)
        end
      when :won
        output_player_data(game_state, player_id)
      else
        if phase_time_check(game_state, :resolution_time)
          GameEngine::GameResolver.resolve_round(game_state)
          unless game_state.won?
            game_state.round += 1
            game_state.phase = :move
            GameEngine::GameResolver.deal_cards(game_state)
          end
          save_game_state(game_state, caching_interface)
        end
      end
      output_player_data(game_state, player_id)
    end

    def self.get_player_move(game_data, player_id, card_id, caching_interface)
      game_state = GameEngine::Cache.fetch_game_state(game_data, caching_interface)
      if game_state.target_player(player_id).selection.empty? && game_state.phase == :move
        GameEngine::IO.input_player_move(game_state, player_id, card_id)
        save_game_state(game_state, caching_interface)
      end
    end
  end
end
