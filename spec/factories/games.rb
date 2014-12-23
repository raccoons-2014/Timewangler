FactoryGirl.define do
  factory :game do
    player_one { build_stubbed :user }
    player_two { build_stubbed :user }
  end
end
