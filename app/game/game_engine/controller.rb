module GameEngine
  module Controller

    def self.save_game_state(game_state)
      GameEngine::Cache.save_game_state(game_state)
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
      game_state = GameEngine::Cache.fetch_game_state(game_data)
      current_time = Time.now

      if game_state.phase == :setup
        if current_time - game_state.time >= GAME_RULES[:setup_time]
          game_state.phase = :move
          game_state.time = Time.now

          GameEngine::GameResolver.deal_cards(game_state)
          GameEngine::Cache.save_game_state(game_state)

          game_state.deal_cards

          save_game_state


          GameEngine::IO.output_player_data(game_state, player_id)

          output_player_data


          save_game_state(game_state)
          output_player_data(game_state, player_id)

        end
      elsif game_state.phase == :move
        if current_time - game_state.time >= GAME_RULES[:move_time]
          if game_state.target_player(player_id.to_i).selection.empty?
            game_state.target_player(player_id.to_i).selection << nil
            save_game_state(game_state)
            output_player_data(game_state, player_id)
          end
        end

        if selection_made?(game_state.player_one) && selection_made?(gitgame_state.player_two)
          game_state.phase = :resolution
          game_state.time = Time.now
          save_game_state(game_state)
          output_player_data(game_state, player_id)
        end
      elsif game_state.phase == :won
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
      end

      output_player_data(game_state, player_id)
    end

    def self.get_player_move(game_data, player_id, card_id)
      game_state = GameEngine::Cache.fetch_game_state(game_data)
      if game_state.target_player(player_id).selection.empty? && game_state.phase == :move
        GameEngine::IO.input_player_move(game_state, player_id, card_id)
        save_game_state(game_state)
      end
    end
  end
end
