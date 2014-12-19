require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  context "when a user loads to the root path" do
      describe "user#new" do
        it "loads a signup page for a user" do
          get :new
          expect(response).to be_success
        end
      end
    end

    context "while filling out the fields" do
      describe "user#create" do
        it "doesn't allow a user to be created if the fields aren't filled out" do
          expect{
            User.create(username: "lulu", password: "ghoul")
          }.to_not change(User, :count)
        end
      end
    end

    context "if proper fields aren't filled out" do
      describe "user#create" do
        it "reloads the page if fields are not filled correctly" do
          post :create, { user: {username: "lulu", password: "ghoul"} }
          expect(response).to render_template("new")
        end
      end
    end

    context "while filling out the fields" do
      describe "user#create" do
        it "allows a user to be created if the fields are filled out" do
          expect{
            User.create(username: "lulu", email: "ghoul@2spooky.com", password: "ghoul", password_confirmation: "ghoul")
          }.to change(User, :count)
        end
      end
    end
end

