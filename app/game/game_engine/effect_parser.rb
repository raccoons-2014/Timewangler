module GameEngine
  module EffectParser
    def self.resolve_effects(game_state)

      self.resolve_target_player(game_state, game_state.player_one)
      self.resolve_target_player(game_state, game_state.player_two)
    end


    private
      def self.resolve_target_player(game_state, player)
        dsl_string = player.selection[0].effect_dsl
        target_player = dsl_string.match(/(?<=\[)(.*)(?=\])/)

        case target_player
        when 'self'
          return player
        when 'opponent'
          game_state.player_one.id == player.id ? return game_state.player_two : return game_state.player_one
        end
      end

      def self.resolve_target_collection(player)
        target_collection = dsl_string.match(/(?<=\()(.*)(?=\>)/)
        target_subset = dsl_string.match(/(?<=\>)(.*)(?=\))/)
      end

      def self.resolve_target_property(player)
        target_property = dsl_string.match(/(?<=\|)(.*)(?=\|)/)
      end

      def self.resolve_target_modifier(player)
        target_modifier = dsl_string.match(/(?<=\{)(.*)(?=\})/)
      end
  end
end
