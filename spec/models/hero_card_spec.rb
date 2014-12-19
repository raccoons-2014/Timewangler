require 'rails_helper'
require 'spec_helper'

RSpec.describe HeroCard, :type => :model do


  context "associations" do
    it {  should belong_to :time_period }
    it {should have_many :deck_card_relationships}
    it {should have_many :decks}
  end

end



