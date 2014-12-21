require 'rails_helper'

RSpec.describe Card, :type => :model do
    it "has a valid factory" do
      card = create(:card)
      expect(card).to be_valid
    end

    it "has a valid model and table" do
      card = Card.create(attributes_for(:card))
    end
end