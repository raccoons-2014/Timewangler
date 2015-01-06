require 'rails_helper'

RSpec.describe User, :type => :model do
  before :each do

  end

  describe "User#count_wins" do
    it "counts how many games a User has won" do
       @user = create(:user)
       @game_one = create(:game, player_one_id: @user.id ,winner_id: @user.id)
       @game_two = create(:game, player_one_id: @user.id, winner_id: @user.id)
      expect(@user.count_wins).to eq(2)
    end
  end

  describe "User#count_losses" do
    it "counts how many games a User has lost" do
      @user = create(:user)
       @user.games << @game_one = create(:game, player_one_id: @user.id ,winner_id: @user.id)
       @user.games << @game_two = create(:game, player_one_id: @user.id, winner_id: @user.id)
      p @user.games
      expect(@user.count_losses).to eq(0)
    end
  end

 context "associations" do
    it { should have_many :games }
    it { should have_one :deck }
  end
end