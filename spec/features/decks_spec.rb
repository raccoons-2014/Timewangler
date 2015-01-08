 require "rails_helper"


feature "Deck building" do
  scenario "User creates a deck and adds a card to his/her deck" do
    user = create(:user)
    deck = user.create_deck(name: "Whatever")
    31.times { user.deck.cards << create(:card)}
    visit root_path
    click_link 'Login'
    fill_in 'session_user_name', with: user.username
    fill_in 'session_user_password', with: user.password
    click_button 'Log In'

    card = create(:card)

    visit deck_path(deck)
    expect(current_path).to eq deck_path(deck)
    expect(page).to have_content '+'
    expect {
      first('.button-primary').click
    }.to change(deck.cards, :count).by(-1)
  end
end