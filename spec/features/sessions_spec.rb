require "rails_helper"


feature "A user tries to log in" do

  scenario "a user tries to log in with username and see their personal user page" do
    user = create(:user)
    visit login_path
    fill_in "session_user_name", with: user.username
    fill_in "session_user_password", with: user.password
    click_button "Log In"

    visit profile_path
    expect(page).to have_content user.username
  end

  scenario "a user tries to log in with email and see their personal user page" do
    user = create(:user)
    visit login_path
    fill_in "session_user_name", with: user.email
    fill_in "session_user_password", with: user.password
    click_button "Log In"

    visit profile_path
    expect(page).to have_content user.username
  end

end
