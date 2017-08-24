10.times do
  User.create!(username: Faker::Name.first_name, password: "password", email: Faker::Internet.safe_email)
end
