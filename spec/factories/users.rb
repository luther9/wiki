FactoryGirl.define do
  pw = 'helloworld'
  factory :user do
    name RandomData.random_name
    sequence(:email) { |n|
      "user#{n}@factory.com"
    }
    password pw
    password_confirmation pw
  end
end
