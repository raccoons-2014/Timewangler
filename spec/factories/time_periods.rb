git # Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :time_period do
    name Faker::Lorem.word
  end
end
