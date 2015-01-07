require 'rails_helper'

describe 'GameEngine::EffectParser' do
  describe 'private methods' do
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
      let(:fake_card) { GameEngine::Card.new(create(:card)) }

      it 'should deduct one strength from the target card' do
        dsl_string = '[player] (hand all) |strength| {-1}'
        old_strength = fake_card.strength
        GameEngine::EffectParser.instance_variable_set(:@dsl_string, dsl_string)
        GameEngine::EffectParser.send(:resolve_target_modifier, fake_card, 'strength')
        expect(fake_card.strength).to eq old_strength - 1
      end

      it 'should deduct one intelligence from the target card' do
        dsl_string = '[player] (hand all) |intelligence| {-1}'
        old_intelligence = fake_card.intelligence
        GameEngine::EffectParser.instance_variable_set(:@dsl_string, dsl_string)
        GameEngine::EffectParser.send(:resolve_target_modifier, fake_card, 'intelligence')
        expect(fake_card.intelligence).to eq old_intelligence - 1
      end

      it 'should deduct one charisma from the target card' do
        dsl_string = '[player] (hand all) |intelligence| {-1}'
        old_charisma = fake_card.charisma
        GameEngine::EffectParser.instance_variable_set(:@dsl_string, dsl_string)
        GameEngine::EffectParser.send(:resolve_target_modifier, fake_card, 'charisma')
        expect(fake_card.charisma).to eq old_charisma - 1
      end


    end


  end
end
