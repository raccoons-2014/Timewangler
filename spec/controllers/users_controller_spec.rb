require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
    context "while filling out the fields" do
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
    end
end
