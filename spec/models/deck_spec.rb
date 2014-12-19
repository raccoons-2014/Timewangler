require 'rails_helper'

RSpec.describe Deck, :type => :model do
  let(:deck) { create(:deck)}

  describe "associations" do
  	it {should have_many :deck_card_relationships}
  	it {should have_many :hero_cards}
  	# it {should belong_to :user} ## Will uncomment this once user model is in and the test is passing
  end 
end
