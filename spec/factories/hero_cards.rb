# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :hero_card do
    name Faker::Name.name
    time_period rand(1..5)
    description Faker::Lorem.sentence
    strength rand(1..5)
    intelligence rand(1..5)
    charisma rand(1..5)
  end
end
