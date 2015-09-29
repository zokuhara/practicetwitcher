5.times do
  User.create username: Faker::Name.first_name, email: Faker::Internet.email, password: "12345678"
end

10.times do
  Twit.create user_id: Faker::Number.between(1, 5), body: Faker::Company.catch_phrase
end
