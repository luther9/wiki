require 'rails_helper'

RSpec.describe Collaborator, type: :model do
  let(:my_user) {
    create :user
  }
  let(:my_wiki) {
    create :wiki
  }
  let(:my_collaborator) {
    create :collaborator, user: my_user, wiki: my_wiki
  }

  it {
    is_expected.to belong_to :user
  }
  it {
    is_expected.to belong_to :wiki
  }
end
