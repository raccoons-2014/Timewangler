FactoryGirl.define do
  factory :match do
    association :player1
    association :player2
  end
end