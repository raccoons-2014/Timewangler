# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :deck_card do
    hero_card
    deck
  end
end
