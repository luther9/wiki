require 'random_data'

5.times do
  User.create!(
    name: RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence
  )
end
users = User.all

15.times {
  Wiki.create!(
    user: users.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
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
