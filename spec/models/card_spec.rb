require 'rails_helper'

RSpec.describe Card, :type => :model do
    it "has a valid factory" do
      card = create(:card)
      expect(card).to be_valid
    end

    describe "associations" do
      it {should have_many :deck_card_relationships}
      it {should have_many :decks}
    end
end
