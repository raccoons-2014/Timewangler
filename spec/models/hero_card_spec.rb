require 'rails_helper'
require 'spec_helper'

RSpec.describe HeroCard, :type => :model do


  context "associations" do
    xit {  should belong_to :time_period }
    xit {should have_many :deck_card_relationships}
    xit {should have_many :decks}
  end

end



