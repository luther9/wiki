require 'rails_helper'

RSpec.describe WikisController, type: :controller do
  let(:my_wiki) {create :wiki}
  before {
    sign_in create :user
  }

  describe "GET #index" do
    before {
      get :index
    }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it('assigns [my_wiki] to @wikis') {
      expect(assigns :wikis).to eq [my_wiki]
    }
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
