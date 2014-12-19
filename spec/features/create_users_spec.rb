require 'rails_helper'

feature "Create Users functionality" do

  scenario "registering users from root page creates player1" do
    register_users!
    expect(User.first.username).to eq("John")
  end

   scenario "registering users from root page creates player2" do
    register_users!
    expect(User.second.username).to eq("Betsy")
  end

  scenario "registering users from root page directs to game show page" do
    register_users!
    expect(page).to have_content("Hello")
  end
end
