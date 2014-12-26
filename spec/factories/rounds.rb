FactoryGirl.define do
  factory :round do
    round_number { rand(1..50)}

    player_one_points { rand(1..20) }
    player_one_hand { "#{(1..6).to_a.shuffle.join(', ')}" }
    player_one_deck { "#{(1..60).to_a.shuffle.join(', ')}" }

    player_two_points { rand(1..20) }
    player_two_hand { "#{(1..6).to_a.shuffle.join(', ')}" }
    player_two_deck { "#{(1..60).to_a.shuffle.join(', ')}" }

    game { build_stubbed(:game) }
  end
end
