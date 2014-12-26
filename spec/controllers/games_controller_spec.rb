require 'rails_helper'

RSpec.describe GamesController, :type => :controller do
  describe "games#destroy" do
    before(:each) { @game = create(:game) }

    it 'should decrease the count of existing games by one after calling the destroy action' do
    expect{ Game.destroy(@game) }.to change(Game, :count)
    end

    it 'should not include the game object in the database after it has been destroyed' do
      Game.destroy(@game)
      expect{ Game.find(@game.id) }.to raise_error ActiveRecord::RecordNotFound
    end
  end
end
