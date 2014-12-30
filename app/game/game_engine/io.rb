module GameEngine
  module IO
    def self.output_player_data(game_state, player_id)

      case player_id
      when game_state.player_one.id
        return { player_hand: game_state.player_one.hand, player_points: game_state.player_two.points, round: game_state.round, phase: game_state.phase }
      when game_state.player_two.id
        return { player_hand: game_state.player_two.hand, player_points: game_state.player_two.points, round: game_state.round, phase: game_state.phase }
      end
    end
  end
end
