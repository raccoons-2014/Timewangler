FactoryGirl.define do
  factory :card do
    card_type { "Hero" }
    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    strength { rand(1..10)}
    intelligence { rand(1..10) }
    charisma { rand(1..10) }
    association :time_period
  end
end