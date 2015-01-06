require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "user#create" do
    it "allows a user to be created when passed the correct data" do
      expect{
        User.create(email: "fake@gmail.com", username: "lulu", password: "password")
      }.to change(User, :count)
    end

    it "does not create a user when passed an empty password" do
      expect{
        User.create(email: "fake@gmail.com", username: "lulu", password: "")
      }.to_not change(User, :count)
    end

    it "does not create a user when passed an empty username" do
      expect{
        User.create(email: "fake@gmail.com", username: "", password: "dfasdfasdf")
      }.to_not change(User, :count)
    end
  end

  describe "user#profile" do
    it 'should direct a logged-in user to their personal profile page' do
      user = create(:user)
      session[:user_id] = user.id
      expect(get :profile).to render_template :profile
    end

    it 'should re-direct any requests that are not logged in to the homepage' do
      expect(get :profile).to redirect_to root_path
    end
  end
end
