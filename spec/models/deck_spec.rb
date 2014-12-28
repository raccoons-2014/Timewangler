require 'rails_helper'

RSpec.describe Deck, :type => :model do
  it "has a valid factory" do
    deck = create(:deck)
    expect(deck).to be_valid
    expect(deck.cards.size).to eq 60
  end

  describe "associations" do
  	it {should have_many :deck_card_relationships}
  	it {should have_many :cards}
  	it {should belong_to :user}
  end
end
