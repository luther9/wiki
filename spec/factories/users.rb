FactoryGirl.define do
  pw = 'helloworld'
  factory :user do
    name Faker::Name.name
    sequence(:email) { |n|
      "user#{n}@factory.com"
    }
    password pw
    password_confirmation pw
    confirmed_at Time.now
  end
end
