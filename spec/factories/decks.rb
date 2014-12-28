FactoryGirl.define do

  factory :deck do

    before(:create) do |deck|
      60.times { deck.cards << build_stubbed(:card) }
    end

    user { build_stubbed :user }
  end
end
