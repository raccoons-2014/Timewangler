require 'rails_helper'


RSpec.describe Game, :type => :model do
context "associations" do
    it {  should belong_to :player_one }
    it {  should belong_to :player_two }
    it {  should belong_to :winner }
  end
end
