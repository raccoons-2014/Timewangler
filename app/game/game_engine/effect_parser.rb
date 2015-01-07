module GameEngine
  module EffectParser
    def self.resolve_effects(game_state)

      target_player = self.resolve_target_player(game_state, game_state.player_one)
      target_subset = self.resolve_target_collection(target_player)
      target_properties = self.resolve_target_properties(target_subset)

      target_subset.each do |card|
          self.resolve_target_modifier(card, property)
        target_properties do |property|
        end
      end

      target_player = self.resolve_target_player(game_state, game_state.player_two)
      target_subset = self.resolve_target_collection(target_player)
      target_properties = self.resolve_target_properties(target_subset)

      target_subset.each do |card|
          self.resolve_target_modifier(card, property)
        target_properties do |property|
        end
      end
    end


    private
      def self.resolve_target_player(game_state, player)
        @dsl_string = player.selection[0].effect_dsl
        target_player = @dsl_string.match(/(?<=\[)(.*)(?=\])/)

        case target_player
        when 'self'
          return player
        when 'opponent'
          if game_state.player_one.id == player.id
            return game_state.player_two
          else
            return game_state.player_one
          end
        end
      end

      def self.resolve_target_collection(player)
        target_collection = @dsl_string.match(/(?<=\()(.*)(?=\>)/)

        case target_collection
        when 'hand'
          collection = player.hand
        when 'deck'
          collection = player.deck
        when 'selection'
          collection = player.selection
        end

        target_subset = @dsl_string.match(/(?<=\>)(.*)(?=\))/)

        case target_subset
        when 'all'
          collection
        when 'rand'
          [collection.sample]
        when /\d/
          [collection[target_subset.to_i]]
        end
      end

      def self.resolve_target_properties(collection)
        target_properties = @dsl_string.match(/(?<=\|)(.*)(?=\|)/)
        all_target_properties = target_properties.split(',')
      end

      def self.resolve_target_modifier(target_card, attribute)
        target_modifier = @dsl_string.match(/(?<=\{)(.*)(?=\})/).to_s
        operator = target_modifier.match(/[\+\*\/\-]/).to_s
        number = target_modifier.match(/\d+/).to_s.to_i

        original_value = target_card.instance_variable_get("@#{attribute}")

        case operator
        when '+'
          target_card.instance_variable_set("@#{attribute}", original_value + number)
        when '-'
          target_card.instance_variable_set("@#{attribute}", original_value - number)
        when '*'
          target_card.instance_variable_set("@#{attribute}", original_value * number)
        when '/'
          target_card.instance_variable_set("@#{attribute}", original_value / number)
        end
      end
  end
end
