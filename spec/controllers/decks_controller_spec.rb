require 'rails_helper'

RSpec.describe DecksController, :type => :controller do
  render_views # <-- You need this to test your json response!

  context "when accessing the deck1 route" do
    describe "user#deck1" do
      it "returns a json object" do
        post :deck1
        expect {JSON.parse(response.body)}.to_not raise_error
      end
    end
  end

  context "when accessing the deck2 route" do
    describe "user#deck2" do
      it "returns a json object" do
        post :deck2
        expect {JSON.parse(response.body)}.to_not raise_error
      end
    end
  end

end
