# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

topic_selection = ["#{Faker::Hacker.unique.noun}", "#{Faker::Food.unique.dish}", "#{Faker::Company.unique.name}","#{Faker::Currency.unique.name}","#{Faker::File.unique.extension}","#{Faker::FunnyName.unique.name}"]


puts "Starting to run seeds file..."

100.times do |topic|
  Topic.create!(title: "#{topic_selection.sample}")
end

puts "100 Topics created"

User.create!(
  email: "#{Faker::Internet.unique.email}",
  password: "asdfasdf",
  password_confirmation: "asdfasdf",
  first_name: "#{Faker::Name.unique.first_name}",
  last_name: "#{Faker::Name.unique.last_name}",
  username: "Adminanator",
  role: "admin"
)

puts "Admin user created"

User.create!(
  email: "#{Faker::Internet.unique.email}",
  password: "asdfasdf",
  password_confirmation: "asdfasdf",
  first_name: "#{Faker::Name.unique.first_name}",
  last_name: "#{Faker::Name.unique.last_name}",
  username: "studentman",
  role: "student"
)

puts "Student user created"

50.times do |post|
  Post.create!(
    title: "#{Faker::FunnyName.unique.name}",
    content: "#{Faker::MichaelScott.quote}",
    topic_id: Topic.last.id,
    user_id: User.last.id
    )
end

puts "50 posts were created"