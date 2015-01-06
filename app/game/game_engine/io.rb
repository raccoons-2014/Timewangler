module GameEngine
  module IO
    def self.output_player_data(game_state, player_id)
      time_remaining = (Time.now - game_state.time).to_i

      case player_id
      when game_state.player_one.id
        return { player_hand: game_state.player_one.hand, player_points: game_state.player_one.points, opponent_points: game_state.player_two.points, player_selection: game_state.player_one.selection, opponent_selection: game_state.player_two.selection, player_name: game_state.player_one.username, :opponent_name: game_state.player_two.username, round: game_state.round, phase: game_state.phase, time_remaining: time_remaining }
      when game_state.player_two.id
        return { player_hand: game_state.player_two.hand, player_points: game_state.player_two.points, opponent_points: game_state.player_one.points, player_selection: game_state.player_two.selection, opponent_selection: game_state.player_one.selection, player_name: game_state.player_two.username, :opponent_name: game_state.player_one.username,round: game_state.round, phase: game_state.phase, time_remaining: time_remaining }
      end
    end

     def self.input_player_move(game_state, player_id, card_id)
        game_state.target_player(player_id).play_cards([card_id])
     end
  end
end
