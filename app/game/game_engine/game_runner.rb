module GameEngine
  module GameRunner
    def self.set_blank(player)
        player.selection = []
    end

    def self.resolve_round(game)
      attr_reader :played_cards
      # This, once again, is some fairly hacky code. There is a massive amount of
      # repetition and nested conditional statements here. The module might not even
      # be necessary.
      # ===========================================
      # NEEDS TO BE REFACTORED BEFORE FINAL VERSION.
      # ===========================================
      player_one = game.player_one
      player_two = game.player_two
      played_cards = [player_one.selection.first, player_two.selection.first]


      if played_cards.include?(nil)
        if played_cards.all? {|x| x.nil?}
          set_blank(player_one)
          set_blank(player_two)
          # return nil
        elsif played_cards[0].nil?
          player_one.points -= played_cards[1].max_stat
          player_two.points += played_cards[1].max_stat
          player_one.selection = []
          player_two.selection = []
        else
          player_two.points -= played_cards[1].max_stat
          player_one.points += played_cards[1].max_stat
          player_one.selection = []
          player_two.selection = []
        end
      elsif played_cards[0].max_stat > played_cards[1].max_stat
        damage = (played_cards[0].max_stat - played_cards[1].max_stat).abs

        player_two.points -= damage
        player_one.points += damage
        player_one.selection = []
        player_two.selection = []
      else
        damage = (played_cards[0].max_stat - played_cards[1].max_stat).abs

        player_one.points -= damage
        player_two.points += damage
        player_one.selection = []
        player_two.selection = []
      end
    end

  end
end
