# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Destroying users...'
User.destroy_all
puts 'Destroying pets...'
Pet.destroy_all
puts 'Destroying dogsittings...'
Dogsitting.destroy_all
puts 'Destroying bookings...'
Booking.destroy_all
puts 'Clean database!'

puts 'Creating test user...'
user = User.create(
  email: "me@me.com",
  password: 1234567,
  first_name: "No",
  last_name: "Body",
  location: "Tokyo"
)
puts 'Test user created...'

puts 'Creating users...'
25.times do
  user = User.create(
    email: Faker::Internet.email,
    password: '1234567',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    location: ["Meguro", "Shinagawa", "Shibuya", "Ueno", "Akihabara", "Ikebukuro", "Iidabashi", "Kamata"].sample
  )
  puts "Created user #{user.id}"

  random = rand(1..2)
  if random == 1
    puts 'Creating pets...'
    pet = Pet.create(
      name: Faker::Creature::Dog.name,
      age: rand(1..18),
      breed: Faker::Creature::Dog.breed,
      size: Faker::Creature::Dog.size,
      user: user
    )
    puts "Created pet #{pet.id}"
  end

  random = rand(1..2)
  if random == 1
    puts 'Creating dogsittings...'
    dogsitting = Dogsitting.create(
      user: user,
      location: user.location,
      latitude: user.latitude,
      longitude: user.longitude,
      day: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"].sample,
      availability: ["Mornings", "Afternoons", "Evenings"].sample,
      rate: rand(1500..5000)
    )
    puts "Created dogsitting #{dogsitting.id}"
  end

  random = rand(1..2)
  if random == 1
    puts 'Creating bookings...'
    booking = Booking.create(
      user: user,
      dogsitting: dogsitting,
      starts_at: DateTime.now,
      ends_at: DateTime.now + 1.hour,
      status: 0
    )
    puts "Created booking #{booking.id}"
  end
end

puts 'Done!'
