require 'rails_helper'

RSpec.describe DecksController, :type => :controller do
  let(:deck_one) {create(:deck)}
  let(:deck_two) {create(:deck)}
  let(:deck_three) {create(:deck)}
  let(:user_one) {create(:user)}

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

  describe "GET#index" do
    it "assigns a user's deck to @deck" do
      session[:user_id] = user_one.id
      new_deck = user_one.create_deck(name: "Test")
      get :index
      expect(assigns(:deck)).to eq(new_deck)
    end

    it "renders the :index template" do
      session[:user_id] = user_one.id
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET#show" do
    it "assigns the User's Deck to @deck" do
      get :show, id: deck_one
      expect(assigns(:deck)).to eq deck_one
    end

    it "renders the :show template" do
      get :show, id: deck_one
      expect(response).to render_template :show
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
