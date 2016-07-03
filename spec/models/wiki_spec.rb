require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:wiki) {create :wiki}

  it {
    is_expected.to have_many :collaborators
  }

  describe("attributes") {
    it("has title and body attributes") {
      expect(wiki).to have_attributes title: "MyString", body: "MyText"
    }

    it('require a user') {
      wiki.user_id = nil
      expect(wiki.valid?).to be_falsey
    }
  }
end
