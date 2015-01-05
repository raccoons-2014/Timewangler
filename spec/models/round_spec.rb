require 'rails_helper'


RSpec.describe Round, :type => :model do
  it "has a valid factory" do
    expect(create(:round)).to be_valid
  end

  it "returns User objects when the player_one or player_two property is invoked" do
    expect(create(:round).player_one.class).to eq User
    expect(create(:round).player_two.class).to eq User
  end

  context "associations" do
     it {  should belong_to :game }
   end

end
