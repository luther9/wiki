5.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.safe_email,
    password: Faker::Internet.password
  )
end
users = User.all

15.times {
  Wiki.create!(
    user: users.sample,
    title: FakeWiki.title,
    body: FakeWiki.body,
    private: false
  )
}

member = User.create!(
  name: 'Member User',
  email: 'member@example.com',
  password: 'a'
)
member.skip_confirmation!
member.save!

puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
