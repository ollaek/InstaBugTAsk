5.times do
    Application.create({
        name: Faker::Book.title,
        token: Faker::Book.title
    })
  end