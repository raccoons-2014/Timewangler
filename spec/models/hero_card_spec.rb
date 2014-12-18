require 'rails_helper'
require 'spec_helper'

RSpec.describe HeroCard, :type => :model do
  let(:hero_card) {create(:hero_card)}

  context "associations" do
    it {  should belong_to :time_period }
  end

end



