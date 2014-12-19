require 'rails_helper'
require 'spec_helper'

RSpec.describe Game, :type => :model do
  let(:first) {create(:user)}
  let(:second) {create(:user)}

  xit "has a valid factory" do
    game = create(:game)
    expect(game).to be_valid
  end

  xit "has two players and a winner." do
    first = User.create(username: "guy", email: "guy@gmail.com", password: "yup")
    second = User.create(username: "more", email: "stuff@gmail.com", password: "ok")
    p first.id
    game = Game.new(player_one: first , player_two: second, winner: first)
     expect(game).to be_valid
  end

end