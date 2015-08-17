require 'faker'

5.times do
  user = User.new(
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end

users = User.all

50.times do 
  Wiki.create!(
    user: users.sample,
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph
  )
end

user = User.first
user.skip_reconfirmation!
user.update_attributes!(
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
)

user = User.second
user.skip_reconfirmation!
user.update_attributes!(
  email: 'premium@example.com',
  password: 'helloworld',
  role: 'premium'
)

user = User.third
user.skip_reconfirmation!
user.update_attributes!(
  email: 'standard@example.com',
  password: 'helloworld',
  role: 'standard'
)

wikis = Wiki.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"