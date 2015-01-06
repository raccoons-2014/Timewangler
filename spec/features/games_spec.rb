require "rails_helper"


feature "A user tries to join a game" do
  before :each do
    user = create(:user)
    user.create_deck(name: "Whatever")
    31.times { user.deck.cards << create(:card)}
    visit login_path
    fill_in "session_user_name", with: user.username
    fill_in "session_user_password", with: user.password
    click_button "Log In"
  end

  scenario "a user looks for a button to join game" do
    visit profile_path
    expect(page).to have_link "Join Game"
  end

  scenario "a user clicks the button to search for game" do

    visit profile_path
    click_link "Join Game"
    expect(page).to have_text "matchmaking"
  end


end
