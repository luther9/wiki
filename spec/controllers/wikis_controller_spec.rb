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
    before {
      get :new
    }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it("renders the #new view") {
      expect(response).to render_template :new
    }

    it('instantiates @wiki') {
      expect(assigns :wiki).not_to be_nil
    }
  end

  describe("POST create") {
    it('increases the number of wikis by 1') {
      expect {
        post :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      }.to change(Wiki, :count).by 1
    }

    it('assigns the new wiki to @wiki') {
      post :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(assigns :wiki).to eq Wiki.last
    }

    it('redirects to the new wiki') {
      post :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(response).to redirect_to Wiki.last
    }
  }

  describe "GET #show" do
    before {
      get :show, id: my_wiki.id
    }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it("renders the #show view") {
      expect(response).to render_template :show
    }

    it('assigns my_wiki to @wiki') {
      expect(assigns :wiki).to eq my_wiki
    }
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
