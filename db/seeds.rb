10.times do
  User.create!(username: Faker::Lovecraft.deity, password: "password", email: Faker::Internet.safe_email)
end

10.times do
  Poem.create!(name: Faker::Lovecraft.word, body: Faker::Lovecraft.paragraph, user_id: rand(1..10))
end
50.times do
  Comment.create!(user_id: rand(1..10), poem_id: rand(1..10), name: Faker::Lovecraft.word, body: Faker::Lovecraft.sentence)
end
