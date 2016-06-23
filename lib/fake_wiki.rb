# A library with functions parallel to Wiki attributes. They return random
# values for those attributes.
module FakeWiki
  def self.title
    Faker::Company.catch_phrase
  end

  def self.body
    Faker::Hipster.paragraph
  end
end
