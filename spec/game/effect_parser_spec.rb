require 'rails_helper'

describe 'GameEngine::EffectParser' do
  describe 'private methods' do
    before(:each) { @fake_card = GameEngine::Card.new(create(:card)) }
    describe '#resolve_target_player' do
      #..
    end

    describe '#resolve_target_collection' do
      #..
    end

    describe '#resolve_target_properties' do
      #..
    end

    describe '#resolve_target_modifier' do

      it 'should deduct 1 strength from the target card' do
        dsl_string = '[player] (selection all) |strength| {-1}'
        old_strength = @fake_card.strength
        GameEngine::EffectParser.instance_variable_set(:@dsl_string, dsl_string)
        GameEngine::EffectParser.send(:resolve_target_modifier, @fake_card, 'strength')
        expect(@fake_card.strength).to eq old_strength - 1
      end

      it 'should deduct 1 intelligence from the target card' do
        dsl_string = '[player] (selection all) |intelligence| {-1}'
        old_intelligence = @fake_card.intelligence
        GameEngine::EffectParser.instance_variable_set(:@dsl_string, dsl_string)
        GameEngine::EffectParser.send(:resolve_target_modifier, @fake_card, 'intelligence')
        expect(@fake_card.intelligence).to eq old_intelligence - 1
      end

      it 'should add 5 intelligence to target card' do
        dsl_string = '[player] (selection all) |intelligence| {+5}'
        old_intelligence = @fake_card.intelligence
        GameEngine::EffectParser.instance_variable_set(:@dsl_string, dsl_string)
        GameEngine::EffectParser.send(:resolve_target_modifier, @fake_card, 'intelligence')
        expect(@fake_card.intelligence).to eq old_intelligence + 5
      end

      it 'should deduct 1 charisma from the target card' do
        dsl_string = '[player] (selection all) |charisma| {+3}'
        old_charisma = @fake_card.charisma
        GameEngine::EffectParser.instance_variable_set(:@dsl_string, dsl_string)
        GameEngine::EffectParser.send(:resolve_target_modifier, @fake_card, 'charisma')
        expect(@fake_card.charisma).to eq old_charisma + 3
      end

      it 'should multiply the strength of target card by 2' do
        dsl_string = '[player] (selection all) |strength| {*2}'
        old_strength = @fake_card.strength
        GameEngine::EffectParser.instance_variable_set(:@dsl_string, dsl_string)
        GameEngine::EffectParser.send(:resolve_target_modifier, @fake_card, 'strength')
        expect(@fake_card.strength).to eq old_strength * 2
      end

      it 'should divide the strength of target card by 3' do
        dsl_string = '[player] (selection all) |strength| {/3}'
        old_strength = @fake_card.strength
        GameEngine::EffectParser.instance_variable_set(:@dsl_string, dsl_string)
        GameEngine::EffectParser.send(:resolve_target_modifier, @fake_card, 'strength')
        expect(@fake_card.strength).to eq old_strength / 3
      end


      it 'should only modify the attribute it is supposed to' do
        dsl_string = '[player] (selection all) |charisma| {-1}'
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
