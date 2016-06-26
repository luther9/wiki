require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context('not logged in') {
    describe('GET #show') {
      it('redirects to login page') {
        get :show
        expect(response).to redirect_to new_user_session_path
      }
    }
  }

  context('user logged in') {
    let(:my_user) {create :user}
    before {
      sign_in my_user
    }

    describe "GET #show" do
      before {get :show, id: my_user.id}

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it('assigns the proper attributes') {
        user = assigns :user
        expect(user.email).to eq my_user.email
        expect(user.role).to eq my_user.role
      }
    end
  }
end
