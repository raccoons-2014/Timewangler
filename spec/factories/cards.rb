FactoryGirl.define do
  factory :card do
    card_type { "Hero" }
    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    strength { rand(1..10)}
    intelligence { rand(1..10) }
    charisma { rand(1..10) }
    time_period { Faker::Lorem.word }
  end

  factory :weak_card, parent: :card do
    strength 1
    intelligence 1
    charisma 1
  end

  factory :strong_card, parent: :card do
    strength 20
    intelligence 15
    charisma 16
  end
end
