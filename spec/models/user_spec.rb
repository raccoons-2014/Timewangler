require 'rails_helper'

RSpec.describe User, :type => :model do
  before :each do
    @user = create(:user)
    @user.games << @game_one = create(:game, player_one_id: @user.id ,winner_id: @user.id)
    @user.games << @game_two = create(:game, player_one_id: @user.id, winner_id: @user.id)
    @user.games << @game_three = create(:game, player_two_id: @user.id, winner_id: @user.id)
  end

  describe "User#count_wins" do
    it "counts how many games a User has won" do
      expect(@user.count_wins).to eq(3)
    end
  end

  describe "User#count_losses" do
    it "counts how many games a User has lost" do
      expect(@user.count_losses).to eq(0)
    end
  end

  describe "User#last_20_games" do
    it "shows the User's last 20 games" do
      expect(@user.last_20_games.length).to eq(3)
    end
  end
end