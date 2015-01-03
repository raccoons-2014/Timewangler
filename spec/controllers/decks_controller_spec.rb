require 'rails_helper'

RSpec.describe DecksController, :type => :controller do
  let(:deck_one) {create(:deck)}
  let(:deck_two) {create(:deck)}
  let(:deck_three) {create(:deck)}

  describe "GET#new" do
    it "assigns a new Deck to @deck" do
      get :new
      expect(assigns(:deck)).to be_a_new(Deck)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST#create" do
    it "creates a new deck and saves it in the databse" do
      user = create(:user)
      session[:user_id] = user.id
      expect { post :create, deck: attributes_for(:deck)}.to change(Deck, :count).by(1)
    end
  end

  describe "GET#edit" do

  end

  describe "PUT#update" do

  end

  describe "DELETE#destroy" do

  end

  describe "add_card" do

  end

  describe "remove_card" do

  end
end
