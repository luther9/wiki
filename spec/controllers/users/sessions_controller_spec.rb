require 'rails_helper'

RSpec.describe(Users::SessionsController, type: :controller) {
  describe('DELETE destroy') {
    it('redirects to login') {
      sign_in create :user
      expect(response).to have_http_status :success
    }
  }
}
