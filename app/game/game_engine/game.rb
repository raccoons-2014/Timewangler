module GameEngine
  GAME_RULES = { starting_points: 30, hand_size: 6 }

  class Game
    attr_reader :id, :player_one_id, :player_one_points, :player_one_deck, :player_one_hand, :player_two_id, :player_two_points, :player_two_deck, :player_two_hand

    def initialize(game_data)
      @id = game_data.id
      @player_one = GameEngine::Player.new(game_data.player_one)
      @player_two = GameEngine::Player.new(game_data.player_two)

      @player_one_id = game_data.player_one_id
      @player_one_points = GAME_RULES[:starting_points]
      @player_one_deck = GameEngine::Deck.new(game_data.player_one.deck)
      @player_one_hand = []

      @player_two_id = game_data.player_two_id
      @player_two_points = GAME_RULES[:starting_points]
      @player_two_deck = GameEngine::Deck.new(game_data.player_two.deck)
      @player_two_hand = []

    end


    def deal_cards
      until player_one_hand.size == GAME_RULES[:hand_size]
        player_one_hand << player_one_deck.list.pop
      end

      until player_two_hand.size == GAME_RULES[:hand_size]
        player_two_hand << player_two_deck.list.pop
      end
    end

    def deck_cards_to_string(deck)
      card_array = []
      deck.list.each do |card|
        card_array << card.id
      end
      card_string = card_array.join(",")
    end

    def p1_deck_cards_to_string
      p1_card_array = []
      @player_one_deck.list.each do |card|
        p1_card_array << card.id
      end
      p1_card_string = p1_card_array.join(",")
    end

    def p2_deck_cards_to_string
      p2_card_array = []
      @player_two_deck.list.each do |card|
        p2_card_array << card.id
      end
      p2_card_string = p2_card_array.join(",")
    end

    def p1_hand_cards_to_string
      p1_card_array = []
      @player_one_hand.each do |card|
        p1_card_array << card.id
      end
      p1_card_string = p1_card_array.join(",")
    end

    def p2_hand_cards_to_string
      p2_card_array = []
      @player_two_hand.each do |card|
        p2_card_array << card.id
      end
      p2_card_string = p2_card_array.join(",")
    end

    def p1_select_card_to_play
      player_one_hand.pop
    end

    def p2_select_card_to_play
      player_two_hand.pop
    end

    def find_last_round
      @last_round = ::Round.where(game_id: @id).last
      @new_round_id = 0
      if @last_round.nil?
        @new_round_id = 0
      else
        @new_round_id = @last_round.round_number +1
      end
      puts "new round id:"
      puts @new_round_id
      @new_round_id
    end

    def play_round
      ::Round.create(round_number: 0,
       player_one_points: player_one_points,
       player_one_hand: p1_hand_cards_to_string,
        player_one_deck: p1_deck_cards_to_string,
        player_two_points: player_two_points,
        player_two_hand: p2_hand_cards_to_string,
        player_two_deck: p2_deck_cards_to_string,
        game_id: @id,
        player_one_choice: nil,
        player_two_choice: nil)

       # ::Round.create(round_number: 0,
       # player_one_points: player_one_points,
       # player_one_hand: p1_hand_cards_to_string,
       #  player_one_deck: p1_deck_cards_to_string,
       #  player_two_points: player_two_points,
       #  player_two_hand: p2_hand_cards_to_string,
       #  player_two_deck: p2_deck_cards_to_string,
       #  game_id: @id,
       #  player_one_choice: p1_select_card_to_play,
       #  player_two_choice: p2_select_card_to_play)

      # ::Round.create(id: 0, player_one_points: player_one_points, player_one_hand: @player_one_hand, player_one_deck: self.p1_deck_cards_to_string, player_two_points: player_two_points, player_two_hand: @player_two_hand, player_two_deck: @player_two_deck, game_id: @id, player_one_choice: nil, player_two_choice: nil)
    end

  end
end
