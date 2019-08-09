# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: 'Example User',
             email: 'example@railstutorial.org')

50.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@railstutorial.org"
  User.create!(name: name,
               email: email)
end

users = User.order(:created_at).take(6)
50.times do |i|
  users.each do |user|
    title = Faker::Book.title
    description = Faker::TvShows::TheITCrowd.quote
    # date = Date.today + i.days
    date = Faker::Date.between(from: -100.days.ago, to: Date.today + 100.days)
    location = Faker::Address.full_address
    user.hosting_events.create!(title: title,
                                description: description,
                                date: date,
                                location: location)
  end
end
users = User.order(:created_at).take(50)
events = Event.order(:date).take(10)

events.each do |event|
  users.each do |user|
    event.attendees << user
  end
end
