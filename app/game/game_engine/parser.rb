module GameEngine
  class Parser
    attr_reader :id, :player_one_points, :player_two_points, :player_one, :player_two

    def initialize(game_data, player_one, player_two, player_one_points, player_two_points)

      @id = game_data.id
      @player_one = player_one
      @player_one_points = player_one_points
      @player_two = player_two
      @player_two_points = player_two_points
    end

    def deck_cards_to_string(player)
      card_array = []
      player.deck.list.each do |card|
        card_array << card.id
      end
      card_string = card_array.join(",")
    end

    def hand_cards_to_string(player)
      card_array = []
      player.hand.each do |card|
        card_array << card.id
      end
      card_string = card_array.join(",")
    end

    def p1_selected_card
      @player_one.hand.pop
    end

    def p2_selected_card
      @player_two.hand.pop
    end

    def find_last_round
      @last_round = ::Round.where(game_id: @id).last
      @new_round_number = 0
      if @last_round.nil?
        @new_round_number = 0
      else
        @new_round_number = @last_round.round_number + 1
      end
      puts "new round id:"
      puts @new_round_number
      @new_round_number
    end

    def save_round
      ::Round.create(round_number: find_last_round,
       player_one_points: player_one_points,
       player_one_hand: hand_cards_to_string(player_one),
        player_one_deck: deck_cards_to_string(player_one),
        player_two_points: player_two_points,
        player_two_hand: hand_cards_to_string(player_two),
        player_two_deck: deck_cards_to_string(player_two),
        game_id: @id,
        player_one_choice: p1_selected_card.id,
        player_two_choice: p2_selected_card.id)
    end

  end
end
