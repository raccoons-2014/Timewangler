module GameEngine
  module EffectParser
    def self.resolve_effects(game_state)
      first_card = game_state.player_one.selection[0]
      second_card = game_state.player_two.selection[0]
    end

    def resolve_target_player(dsl_string)
      #..
    end

    def resolve_target_collection(dsl_string)
      #..
    end

    def resolve_target_property(dsl_string)
      #..
    end

    def resolve_target_modifier(dsl_string)
      #..
    end
  end
end
