require 'rails_helper'
require 'spec_helper'

RSpec.describe TimePeriod, :type => :model do
  let(:time_period) { create(:time_period)}

  it "has a name" do
    expect(time_period.name).to be_a String
  end

  context "associations" do
    it {  should have_many :hero_cards }
  end
end
