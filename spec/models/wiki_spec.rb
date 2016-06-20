require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:wiki) {create :wiki}

  describe("attributes") {
    it("has title and body attributes") {
      expect(wiki).to have_attributes title: "MyString", body: "MyText"
    }
  }
end
