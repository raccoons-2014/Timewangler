require 'rails_helper'
require 'spec_helper'

RSpec.describe HeroCard, :type => :model do
  let(:user) {create(:user)}

  context "associations" do
    it {  should have_many :matchups }
    it {  should have_many :games}
  end

end

