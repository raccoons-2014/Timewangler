# indent! 2 spaces in Ruby

# And...delete me.
def register_users!
    visit('/')
    fill_in('P1 Username', :with => 'John')
    fill_in('P2 Username', :with => 'Betsy')
    click_button "Register"
end
