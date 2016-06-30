require 'rails_helper'

RSpec.describe WikisController, type: :controller do
  let(:my_wiki) {create :wiki}
  let(:my_user) {create :user}
  before {
    sign_in my_user
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
        post :create, wiki: {title: FakeWiki.title, body: FakeWiki.body}
      }.to change(Wiki, :count).by 1
    }

    it('assigns the new wiki to @wiki') {
      post :create, wiki: {title: FakeWiki.title, body: FakeWiki.body}
      expect(assigns :wiki).to eq Wiki.last
    }

    it('redirects to the new wiki') {
      post :create, wiki: {title: FakeWiki.title, body: FakeWiki.body}
      expect(response).to redirect_to Wiki.last
    }

    it('creates a persistent wiki') {
      title = FakeWiki.title
      body = FakeWiki.body
      post :create, wiki: {title: title, body: body}
      wiki = Wiki.last
      expect(wiki.valid?).to eq true
      expect(wiki.user).to eq my_user
      expect(wiki.title).to eq title
      expect(wiki.body).to eq body
    }
  }

  describe "GET #show" do
    before {
      get :show, id: my_wiki.id
    }

    it('has a markdown instance variable') {
      expect((assigns :markdown).class).to eq Redcarpet::Markdown
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
    before {
      get :edit, id: my_wiki.id
    }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it("renders the #edit view") {
      expect(response).to render_template :edit
    }

    it('assigns wiki to be updated to @wiki') {
      wiki_instance = assigns :wiki

      expect(wiki_instance.id).to eq my_wiki.id
      expect(wiki_instance.title).to eq my_wiki.title
      expect(wiki_instance.body).to eq my_wiki.body
    }
  end

  describe("PUT update") {
    let(:new_title) {FakeWiki.title}
    let(:new_body) {FakeWiki.body}
    before {
      put :update, id: my_wiki.id, wiki: {title: new_title, body: new_body}
    }

    it('updates wiki with expected attributes') {
      updated_wiki = assigns :wiki
      expect(updated_wiki.id).to eq my_wiki.id
      expect(updated_wiki.title).to eq new_title
      expect(updated_wiki.body).to eq new_body
    }

    it('redirects to the updated wiki') {
      expect(response).to redirect_to my_wiki
    }
  }

  describe "DELETE #destroy" do
    before {
      delete :destroy, id: my_wiki.id
    }

    it('deletes the wiki') {
      count = Wiki.where(id: my_wiki.id).size
      expect(count).to eq 0
    }

    it('redirects to wikis index') {
      expect(response).to redirect_to wikis_path
    }
  end

end
