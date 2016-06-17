require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  context('user signed in') {
    before {
      sign_in create :user
    }

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #about" do
      it "returns http success" do
        get :about
        expect(response).to have_http_status(:success)
      end
    end
  }

  context('nobody signed in') {
    describe "GET #index" do
      it "returns http redirect" do
        get :index
        expect(response).to have_http_status(302)
      end
    end

    describe "GET #about" do
      it "returns http redirect" do
        get :about
        expect(response).to have_http_status(302)
      end
    end
  }
end
