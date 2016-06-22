require 'rails_helper'

RSpec.describe User, type: :model do
  let(:my_user) {
    create :user
  }

  it {is_expected.to validate_presence_of :name}

  it {is_expected.to validate_presence_of :email}
  it {is_expected.to validate_uniqueness_of :email}
  it {is_expected.to allow_value("user@bloccit.com").for :email}

  it {is_expected.to validate_presence_of :password}

  describe('POST create') {
    it('has all attributes') {
      expect(my_user).to have_attributes name: my_user.name, email: my_user.email, password: my_user.password, role: 'standard'
    }
  }

  describe("attributes") {
    it("responds to role") {
      expect(my_user).to respond_to :role
    }

    it("responds to standard?") {
      expect(my_user).to respond_to :standard?
    }

    it("responds to premium?") {
      expect(my_user).to respond_to :premium?
    }

    it("responds to admin?") {
      expect(my_user).to respond_to :admin?
    }
  }

  describe("roles") {
    it('is standard by default') {
      expect(my_user.role).to eq 'standard'
    }

    it('standard returns true for #standard? and false for others') {
      expect(my_user.standard?).to be_truthy
      expect(my_user.premium?).to be_falsey
      expect(my_user.admin?).to be_falsey
    }

    it('premium returns true for #premium? and false for others') {
      my_user.premium!
      expect(my_user.standard?).to be_falsey
      expect(my_user.premium?).to be_truthy
      expect(my_user.admin?).to be_falsey
    }

    it('admin returns true for #admin? and false for others') {
      my_user.admin!
      expect(my_user.standard?).to be_falsey
      expect(my_user.premium?).to be_falsey
      expect(my_user.admin?).to be_truthy
    }
  }
end
