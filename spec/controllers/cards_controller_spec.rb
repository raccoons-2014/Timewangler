require 'rails_helper'

RSpec.describe CardsController, :type => :controller do
  let(:card_1) {create(:card)}
  let(:card_2) {create(:card)}

    describe "GET#new" do
      it "assigns a new Card to @card" do
        get :new
        expect(assigns(:card)).to be_a_new(Card)
      end

      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end


    describe "POST#create" do
      it "allows a card to be created when passed the correct data" do
        expect{ post :create, card: attributes_for(:card)}.to change(Card, :count).by(1)
      end
    end

    describe "GET#index" do
      it "allows a user to view all the cards in the game" do
        get :index
        expect(assigns(:cards)).to match_array([card_1, card_2])
      end

      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end

    describe "cards#edit" do
      xit "allows a developer to edit card attributes" do
      end
    end


end
