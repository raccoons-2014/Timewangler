require 'rails_helper'

RSpec.describe Deck, :type => :model do
  describe "associations" do
  	it {should have_many :deck_card_relationships}
  	it {should have_many :cards}
  	it {should belong_to :user}
  end
end
