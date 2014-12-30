module GameEngine
  module GameRunner
    def self.resolve_round(game)
      played_cards = [game.player_one.selection.first, game.player_two.selection.first]

      if played_cards[0].nil? || played_cards[1].nil?
        if played_cards[0].nil? && played_cards[1].nil?
          player_one.selection = []
          player_two.selection = []
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
        # return nil if damage == 0

        player_one.points -= damage
        player_two.points += damage
        player_one.selection = []
        player_two.selection = []
      end
    end

  end
end
