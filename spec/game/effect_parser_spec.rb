require 'rails_helper'

describe 'GameEngine::EffectParser' do

  describe '#resolve_effects'do
    before(:each) do
      game_data = create(:game)
      game_data.player_one = create(:user)
      game_data.player_one.deck = create(:deck)
      game_data.player_two = create(:user)
      game_data.player_two.deck = create(:deck)
      @fake_game = GameEngine::GameState.new(game_data)
      @fake_game.player_one.selection << GameEngine::Card.new(create(:card))
      @fake_game.player_two.selection << GameEngine::Card.new(create(:card)).dup
    end

    it 'should resolve a simple case where both effects are the same' do
      dsl_string = '[opponent] (selection>all) |charisma| {-3}'
      @fake_game.player_one.selection[0].instance_variable_set(:@effect_dsl, dsl_string)
      @fake_game.player_two.selection[0].instance_variable_set(:@effect_dsl, dsl_string)
      player_one_card_old_charisma = @fake_game.player_one.selection[0].charisma
      player_two_card_old_charisma = @fake_game.player_two.selection[0].charisma
      GameEngine::EffectParser.resolve_effects(@fake_game)
      expect(@fake_game.player_one.selection[0].charisma).to eq player_one_card_old_charisma - 3
      expect(@fake_game.player_two.selection[0].charisma).to eq player_two_card_old_charisma - 3
    end

    it 'should resolve a simple case where both effects are the same, charisma = 0' do
      dsl_string = '[opponent] (selection>all) |charisma| {=0}'
      @fake_game.player_one.selection[0].instance_variable_set(:@effect_dsl, dsl_string)
      @fake_game.player_two.selection[0].instance_variable_set(:@effect_dsl, dsl_string)
      player_one_card_old_charisma = @fake_game.player_one.selection[0].charisma
      player_two_card_old_charisma = @fake_game.player_two.selection[0].charisma
      GameEngine::EffectParser.resolve_effects(@fake_game)
      expect(@fake_game.player_one.selection[0].charisma).to eq 0
      expect(@fake_game.player_two.selection[0].charisma).to eq 0
    end

    it 'should resolve a more complex case' do
      dsl_string_one = '[player] (selection>all) |charisma| {+3}'
      dsl_string_two = '[player] (selection>all) |intelligence| {*2}'
      @fake_game.player_one.selection[0].instance_variable_set(:@effect_dsl, dsl_string_one)
      @fake_game.player_two.selection[0].instance_variable_set(:@effect_dsl, dsl_string_two)
      player_one_card_old_charisma = @fake_game.player_one.selection[0].charisma
      player_two_card_old_intelligence = @fake_game.player_two.selection[0].intelligence
      GameEngine::EffectParser.resolve_effects(@fake_game)
      expect(@fake_game.player_one.selection[0].charisma).to eq player_one_card_old_charisma + 3
      expect(@fake_game.player_two.selection[0].intelligence).to eq player_two_card_old_intelligence * 2
    end

    it 'should resolve a complex case where multiple stats are affected' do
      dsl_string_one = '[player] (selection>all) |charisma, strength| {+3}'
      dsl_string_two = '[opponent] (selection>rand) |intelligence| {-5}'
      @fake_game.player_one.selection[0].instance_variable_set(:@effect_dsl, dsl_string_one)
      @fake_game.player_two.selection[0].instance_variable_set(:@effect_dsl, dsl_string_two)
      player_one_card_old_charisma = @fake_game.player_one.selection[0].charisma
      player_one_card_old_strength = @fake_game.player_one.selection[0].strength
      player_one_card_old_intelligence = @fake_game.player_one.selection[0].intelligence
      GameEngine::EffectParser.resolve_effects(@fake_game)
      expect(@fake_game.player_one.selection[0].charisma).to eq player_one_card_old_charisma + 3
      expect(@fake_game.player_one.selection[0].strength).to eq player_one_card_old_strength + 3
      expect(@fake_game.player_one.selection[0].intelligence).to eq player_one_card_old_intelligence - 5
    end


  end

  describe 'Private Methods' do
    before(:each) { @fake_card = GameEngine::Card.new(create(:card)) }

    describe '#resolve_target_player' do
      before(:each) do
        game_data = create(:game)
        game_data.player_one = create(:user)
        game_data.player_one.deck = create(:deck)
        game_data.player_two = create(:user)
        game_data.player_two.deck = create(:deck)
        @fake_game = GameEngine::GameState.new(game_data)
        @fake_game.player_one.selection << GameEngine::Card.new(create(:card))
        @fake_game.player_two.selection << GameEngine::Card.new(create(:card)).dup
      end

      it 'should return the correct player when target is player' do
        dsl_string = '[player] (selection>all) |charisma| {-3}'
        @fake_game.player_one.selection[0].instance_variable_set(:@effect_dsl, dsl_string)
        @fake_game.player_two.selection[0].instance_variable_set(:@effect_dsl, dsl_string)
        expect(GameEngine::EffectParser.send(:resolve_target_player, @fake_game, @fake_game.player_one)).to eq @fake_game.player_one
      end

      it 'should return the correct player when target is opponent' do
        dsl_string = '[opponent] (selection>all) |charisma| {-3}'
        @fake_game.player_one.selection[0].instance_variable_set(:@effect_dsl, dsl_string)
        @fake_game.player_two.selection[0].instance_variable_set(:@effect_dsl, dsl_string)
        expect(GameEngine::EffectParser.send(:resolve_target_player, @fake_game, @fake_game.player_one)).to eq @fake_game.player_two
      end
    end

    describe '#resolve_target_collection' do
      before(:each) do
        user_data = create(:user)
        user_data.deck = create(:deck)
        @fake_player = GameEngine::Player.new(user_data)
        5.times { @fake_player.hand << GameEngine::Card.new(create(:card)) }
        @fake_player.selection << GameEngine::Card.new(create(:card))
      end

      it 'should return the correct collection when called on all player selection' do
        dsl_string = '[player] (selection>all) |charisma| {-3}'
        GameEngine::EffectParser.instance_variable_set(:@dsl_string, dsl_string)
        expect(GameEngine::EffectParser.send(:resolve_target_collection, @fake_player)).to eq @fake_player.selection
      end

      it 'should return the correct collection when called on random player selection' do
        dsl_string = '[player] (selection>rand) |charisma| {-3}'
        GameEngine::EffectParser.instance_variable_set(:@dsl_string, dsl_string)
        expect(GameEngine::EffectParser.send(:resolve_target_collection, @fake_player)).to eq @fake_player.selection
      end

    it 'should return the correct collection when called on a specific player selection' do
      dsl_string = '[player] (selection>0) |charisma| {-3}'
      GameEngine::EffectParser.instance_variable_set(:@dsl_string, dsl_string)
      expect(GameEngine::EffectParser.send(:resolve_target_collection, @fake_player)).to eq @fake_player.selection
    end

    it 'should return the correct collection when called on the first card in player hand' do
      dsl_string = '[player] (hand>0) |charisma| {-3}'
      GameEngine::EffectParser.instance_variable_set(:@dsl_string, dsl_string)
      expect(GameEngine::EffectParser.send(:resolve_target_collection, @fake_player)).to eq [@fake_player.hand[0]]
    end

    it 'should return the correct collection when called on the third card in player hand' do
      dsl_string = '[player] (hand>2) |charisma| {-3}'
      GameEngine::EffectParser.instance_variable_set(:@dsl_string, dsl_string)
      expect(GameEngine::EffectParser.send(:resolve_target_collection, @fake_player)).to eq [@fake_player.hand[2]]
    end

    it 'should return a card from the hand when called on a random card in player hand' do
      dsl_string = '[player] (hand>rand) |charisma| {-3}'
      GameEngine::EffectParser.instance_variable_set(:@dsl_string, dsl_string)
      result = GameEngine::EffectParser.send(:resolve_target_collection, @fake_player)
      expect(@fake_player.hand.include? result[0]).to eq true
    end

    it 'should return the correct collection when called on all cards in player hand' do
      dsl_string = '[player] (hand>all) |charisma| {-3}'
      GameEngine::EffectParser.instance_variable_set(:@dsl_string, dsl_string)
      expect(GameEngine::EffectParser.send(:resolve_target_collection, @fake_player)).to eq @fake_player.hand
    end

    it 'should return the correct collection when called on all cards in player deck' do
      dsl_string = '[player] (deck>all) |charisma| {-3}'
      GameEngine::EffectParser.instance_variable_set(:@dsl_string, dsl_string)
      expect(GameEngine::EffectParser.send(:resolve_target_collection, @fake_player)).to eq @fake_player.deck.list
    end

    it 'should return a card from the deck when called on a random card in player deck' do
      dsl_string = '[player] (deck>rand) |charisma| {-3}'
      GameEngine::EffectParser.instance_variable_set(:@dsl_string, dsl_string)
      result = GameEngine::EffectParser.send(:resolve_target_collection, @fake_player)
      expect(@fake_player.deck.list.include? result[0]).to eq true
    end

    it 'should return the correct collection when called on the tenth card in player hand' do
      dsl_string = '[player] (deck>10) |charisma| {-3}'
      GameEngine::EffectParser.instance_variable_set(:@dsl_string, dsl_string)
      expect(GameEngine::EffectParser.send(:resolve_target_collection, @fake_player)).to eq [@fake_player.deck.list[10]]
    end
  end

    describe '#resolve_target_properties' do
      it 'should derive just one property when only one is specified' do
        dsl_string = '[player] (selection>all) |charisma| {-1}'
        GameEngine::EffectParser.instance_variable_set(:@dsl_string, dsl_string)
        expect(GameEngine::EffectParser.send(:resolve_target_properties)).to eq ['charisma']
      end

      it 'should derive just two properties when two are specified' do
        dsl_string = '[player] (selection>all) |strength, intelligence| {-1}'
        GameEngine::EffectParser.instance_variable_set(:@dsl_string, dsl_string)
        expect(GameEngine::EffectParser.send(:resolve_target_properties)).to eq ['strength', 'intelligence']
      end

      it 'should derive all three properties when three are specified' do
        dsl_string = '[player] (selection>all) |strength, intelligence, charisma| {-1}'
        GameEngine::EffectParser.instance_variable_set(:@dsl_string, dsl_string)
        expect(GameEngine::EffectParser.send(:resolve_target_properties)).to eq ['strength', 'intelligence', 'charisma']
      end
    end

    describe '#resolve_target_modifier' do

      it 'should correctly subtract from strength target card' do
        dsl_string = '[player] (selection>all) |strength| {-1}'
        old_strength = @fake_card.strength
        GameEngine::EffectParser.instance_variable_set(:@dsl_string, dsl_string)
        GameEngine::EffectParser.send(:resolve_target_modifier, @fake_card, 'strength')
        expect(@fake_card.strength).to eq old_strength - 1
      end

      it 'should correctly subtract intelligence from target card' do
        dsl_string = '[player] (selection>all) |intelligence| {-1}'
        old_intelligence = @fake_card.intelligence
        GameEngine::EffectParser.instance_variable_set(:@dsl_string, dsl_string)
        GameEngine::EffectParser.send(:resolve_target_modifier, @fake_card, 'intelligence')
        expect(@fake_card.intelligence).to eq old_intelligence - 1
      end

      it 'should correctly add 5 intelligence to target card' do
        dsl_string = '[player] (selection>all) |intelligence| {+5}'
        old_intelligence = @fake_card.intelligence
        GameEngine::EffectParser.instance_variable_set(:@dsl_string, dsl_string)
        GameEngine::EffectParser.send(:resolve_target_modifier, @fake_card, 'intelligence')
        expect(@fake_card.intelligence).to eq old_intelligence + 5
      end

      it 'should correctly add 3 intelligence to target card' do
        dsl_string = '[player] (selection>all) |charisma| {+3}'
        old_charisma = @fake_card.charisma
        GameEngine::EffectParser.instance_variable_set(:@dsl_string, dsl_string)
        GameEngine::EffectParser.send(:resolve_target_modifier, @fake_card, 'charisma')
        expect(@fake_card.charisma).to eq old_charisma + 3
      end

      it 'should correctly multiply target card strength by 2' do
        dsl_string = '[player] (selection>all) |strength| {*2}'
        old_strength = @fake_card.strength
        GameEngine::EffectParser.instance_variable_set(:@dsl_string, dsl_string)
        GameEngine::EffectParser.send(:resolve_target_modifier, @fake_card, 'strength')
        expect(@fake_card.strength).to eq old_strength * 2
      end

      it 'should correctly divide target card strength by 3' do
        dsl_string = '[player] (selection>all) |strength| {/3}'
        old_strength = @fake_card.strength
        GameEngine::EffectParser.instance_variable_set(:@dsl_string, dsl_string)
        GameEngine::EffectParser.send(:resolve_target_modifier, @fake_card, 'strength')
        expect(@fake_card.strength).to eq old_strength / 3
      end

      it 'should correctly make target card strength equal 0' do
        dsl_string = '[player] (selection>all) |strength| {=0}'
        old_strength = @fake_card.strength
        GameEngine::EffectParser.instance_variable_set(:@dsl_string, dsl_string)
        GameEngine::EffectParser.send(:resolve_target_modifier, @fake_card, 'strength')
        expect(@fake_card.strength).to eq 0
      end


      it 'should only modify the specified card attribute and not others' do
        dsl_string = '[player] (selection>all) |charisma| {-1}'
        original_strength = @fake_card.strength
        original_charisma = @fake_card.charisma
        original_intelligence = @fake_card.intelligence
        GameEngine::EffectParser.instance_variable_set(:@dsl_string, dsl_string)
        GameEngine::EffectParser.send(:resolve_target_modifier, @fake_card, 'charisma')
        expect(@fake_card.charisma).to eq original_charisma - 1
        expect(@fake_card.strength).to eq original_strength
        expect(@fake_card.intelligence).to eq original_intelligence
      end




    end


  end
end
