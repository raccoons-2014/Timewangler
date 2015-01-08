module GameEngine
  class Card
    attr_reader :id, :card_type, :name, :description, :strength, :intelligence, :charisma, :time_period, :effect_description, :effect_dsl

    def initialize(card_data)
      @id = card_data.id
      @type = card_data.card_type
      @name = card_data.name
      @description = card_data.description
      @effect_description = card_data.effect_description
      @effect_dsl = card_data.effect_dsl
      @strength = card_data.strength
      @intelligence = card_data.intelligence
      @charisma = card_data.charisma
      @time_period = card_data.time_period
      @picture_url = card_data.picture_url
    end

    def max_stat
      [strength,intelligence,charisma].max
    end

    def has_effect?
      effect_dsl != nil
    end
  end
end
