# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create(email: "test@test.com", password: "password")

# Property.create(price:100, name:'Entire Condo in Downtown Toronto', address: '123 Queens St', city: 'Toronto', state: 'Ontario', country: 'Canada', capacity: 3, user_id: 1, property_type: 1)

# User.create(email: "booking@test.com", password: "password")

Booking.create(user_id: 2, property_id: 1, start_date: Date.today, end_date: Date.tomorrow)