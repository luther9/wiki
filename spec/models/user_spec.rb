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
      expect(my_user).to have_attributes name: my_user.name, email: my_user.email, password: my_user.password
    }
  }
end
