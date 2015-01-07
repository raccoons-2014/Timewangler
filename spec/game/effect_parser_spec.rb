require 'rails_helper'

describe 'GameEngine::EffectParser' do
  describe 'private methods' do
    before(:each) { @fake_card = GameEngine::Card.new(create(:card)) }

    describe '#resolve_target_player' do
      #..
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
