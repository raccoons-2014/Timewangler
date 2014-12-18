require 'rails_helper'
require 'spec_helper'

RSpec.describe Matchup, :type => :model do
  let(:matchup) {create(:matchup)}
  it "has a valid factory" do
    expect(matchup).to be_valid
  end

  context "associations" do
    it { should belong_to :game}
    it { should belong_to :player1}
    it { should belong_to :player2}
  end
end