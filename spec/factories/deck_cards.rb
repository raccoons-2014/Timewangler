# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :deck_card_relationship do
   association :card
   association :deck
  end
end
