User.create!([
  {email: "user1@test.com", password_digest: "$2a$10$rAwFm69chckdOAs8VNyYsOpksSbH1z/ORrsCKZ.hja724MFkrwfge"},
  {email: "user2@test.com", password_digest: "$2a$10$xkyQE0uS27LcSDYwxbfoh.nD3CxzMMPf/lGCjSeE1h9tiiC9CaCri"},
  {email: "user3@test.com", password_digest: "$2a$10$FIIYYHefc.Gnlmi.G.YSiOpVwqt2f9bBkzCZ/0YbTV8dGec6HoJ/W"}
])

Property.create!([
  {price: 100, name: "Private Unit By the Park", property_type: "shared_room", address: "1860 Bayview Ave", city: "East York", state: "Ontario", country: "Canada", capacity: 3, image: "property1.jpg", user_id: 1},
  {price: 200, name: "Entire Condo in Downtown Toronto", property_type: "shared_room", address: "1 Toronto St", city: "Toronto", state: "Ontario", country: "Canada", capacity: 3, image: "property4.jpg", user_id: 1},
  {price: 70, name: "Room in Quiet Neighbourhood", property_type: "private_room", address: "83 Redpath Avenue", city: "Toronto", state: "Ontario", country: "Canada", capacity: 3, image: "property3.jpg", user_id: 2},
  {price: 40, name: "Shared Room in Koreatown", property_type: "shared_room", address: "215 Grace St", city: "Toronto", state: "Ontario", country: "Canada", capacity: 3, image: "property2.jpeg", user_id: 3}
])

Booking.create!([
  {status: 1, user_id: 1, property_id: 2, start_date: "2018-05-20", end_date: "2018-05-31"},
  {status: 1, user_id: 2, property_id: 4, start_date: "2018-05-25", end_date: "2018-05-31"},
  {status: 1, user_id: 3, property_id: 1, start_date: "2018-06-01", end_date: "2018-06-09"},
])