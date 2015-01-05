require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  context "while logging in as a user" do
    render_views
    describe "sessions#new" do
      # No.  Test on which template you render
      it "renders a template with a form tag for logging in a user" do
        get :new
        expect(response.body).to match(/form/)
      end
    end
  end
end
