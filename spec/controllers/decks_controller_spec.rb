require 'rails_helper'

RSpec.describe DecksController, :type => :controller do
  let(:deck_one) {create(:deck)}
  let(:deck_two) {create(:deck)}
  let(:deck_three) {create(:deck)}
  let(:user_one) {create(:user)}
  let(:card_one) {create(:card)}

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
    it "creates a new deck and saves it in the database" do
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
      new_deck = user_one.create_deck(name: "Test")
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
    it "assigns the Deck to @deck" do
      get :edit, id: deck_one
      expect(assigns(:deck)).to eq deck_one
    end

    it "renders the :edit template" do
      get :edit, id: deck_one
      expect(response).to render_template :edit
    end
  end

  describe "PUT#update" do
    it "redirects to the updated Deck" do
      put :update, id: deck_one, deck: attributes_for(:deck)
      expect(response).to redirect_to deck_path(deck_one)
    end
  end

  describe "DELETE#destroy" do
    it "deletes the Deck" do
      session[:user_id] = user_one.id
      new_deck = user_one.create_deck(name: "Test")
      expect {delete :destroy, id: new_deck}.to change(Deck, :count).by(-1)
    end

    it "redirects to the Profile page" do
      session[:user_id] = user_one.id
      new_deck = user_one.create_deck(name: "Test")
      delete :destroy, id: new_deck
      expect(response).to redirect_to profile_path
    end
  end
end
