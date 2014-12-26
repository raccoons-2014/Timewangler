module GameEngine
  class Round

    def initialize(round_data)
      @player_one_id = round_data.player_one_id
      @player_one_points = round_data.player_one_points
      @player_two_id = round_data.player_two_id
      @player_two_points = round_data.player_two_points
    end
  end
end
