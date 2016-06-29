5.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.safe_email,
    password: Faker::Internet.password
  )
end

member = User.create!(
  name: 'Member User',
  email: 'member@example.com',
  password: 'a'
)

premium = User.create!(
  name: 'Premium User',
  email: 'premium@example.com',
  password: 'a',
  role: :premium
)

admin = User.create!(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'a',
  role: :admin
)

[member, premium, admin].each { |u|
  u.skip_confirmation!
  u.save!
}

users = User.all

15.times {
  Wiki.create!(
    user: users.sample,
    title: FakeWiki.title,
    body: FakeWiki.body,
    private: false
  )
}

puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
