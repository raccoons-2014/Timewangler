module GameEngine
  module Controller

    def self.save_game_state(game_state)
      GameEngine::Cache.save_game_state(game_state)
    end

    def self.fetch_game_state(game_data)
      GameEngine::Cache.fetch_game_state(game_data)
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


    def self.advance_game(game_data, player_id)
      # This method is responsible for switching phases inside of the GameEngine::Game
      # class when passed the ActiveRecord model of the game and the player_id for the
      # client that's making the request.
      game_state = fetch_game_state(game_data)
      current_time = Time.now

      current_player = game_state.target_player(player_id.to_i)
      player_one = game_state.player_one
      player_two = game_state.player_two

      case game_state.phase
      when :setup
        if current_time - game_state.time >= GAME_RULES[:setup_time]
          game_state.phase = :move

          GameEngine::GameResolver.deal_cards(game_state)

          update_game_state_time(game_state)

          save_game_state(game_state)
          output_player_data(game_state, player_id)

        end
      when :move
        if current_time - game_state.time >= GAME_RULES[:move_time]
          if !selection_made?(current_player)
            current_player.selection << nil
            save_game_state(game_state)
            output_player_data(game_state, player_id)
          end
        end

        if selection_made?(player_one) && selection_made?(player_two)
          game_state.phase = :resolution
          update_game_state_time(game_state)
          save_game_state(game_state)
          output_player_data(game_state, player_id)
        end
      when :won
        output_player_data(game_state, player_id)
      else
        if current_time - game_state.time >= GAME_RULES[:resolution_time]
          GameEngine::GameResolver.resolve_round(game_state)
          unless game_state.won?
            game_state.round += 1
            game_state.phase = :move
            GameEngine::GameResolver.deal_cards(game_state)
          end
          save_game_state(game_state)
        end
      endgit

      output_player_data(game_state, player_id)
    end

    def self.get_player_move(game_data, player_id, card_id)
      game_state = fetch_game_state(game_data)
      if game_state.target_player(player_id).selection.empty? && game_state.phase == :move
        GameEngine::IO.input_player_move(game_state, player_id, card_id)
        save_game_state(game_state)
      end
    end
  end
end
