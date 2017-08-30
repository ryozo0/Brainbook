# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do |n|
  email = Faker::Internet.email
  password = "password"
  uid = SecureRandom.hex(8)
  provider = SecureRandom.hex(8)
  name = SecureRandom.hex(5)
  User.create(email: email,
              name: name,
              password: password,
              password_confirmation: password,
              uid: uid,
              provider: provider,
              )
end

n = 1
while n <= 100
  Post.create(title: "聞いた",
              content: "話",
              user_id: n)
  n += 1
end
