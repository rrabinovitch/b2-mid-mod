# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

MechanicRide.destroy_all
Ride.destroy_all
Mechanic.destroy_all
AmusementPark.destroy_all

sam = Mechanic.create!(name: "Sam Mills", years_of_experience: 10)
kara = Mechanic.create!(name: "Kara Smith", years_of_experience: 11)

hershey = AmusementPark.create!(name: "Hershey Park", admission_price: 50)

lightning_racer = Ride.create!(name: "Lightning Racer", thrill_rating: 9, amusement_park_id: hershey.id)
storm_runner = Ride.create!(name: "Storm Runner", thrill_rating: 7, amusement_park_id: hershey.id)
great_bear = Ride.create!(name: "The Great Bear", thrill_rating: 2, amusement_park_id: hershey.id)
