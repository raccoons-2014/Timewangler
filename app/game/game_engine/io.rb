module GameEngine
  module IO
    def self.output_player_data(game_state, player_id)

      case player_id
      when game_state.player_one.id
        return { player_hand: game_state.player_one.hand, player_points: game_state.player_two.points, round: game_state.round, phase: game_state.phase, time_remaining: GameEngine::GAME_RULES["#{game_state.phase}_time".to_sym] - (Time.now - game_state.time).to_i }
      when game_state.player_two.id
        return { player_hand: game_state.player_two.hand, player_points: game_state.player_two.points, round: game_state.round, phase: game_state.phase, time_remaining: GameEngine::GAME_RULES["#{game_state.phase}_time".to_sym] - (Time.now - game_state.time).to_i  }
      end
    end
  end
end
