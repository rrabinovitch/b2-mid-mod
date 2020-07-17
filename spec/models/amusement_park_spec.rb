require 'rails_helper'

RSpec.describe AmusementPark do
  # Amusement Parks have a name and admission price

  describe 'relationships' do
    it {should have_many :rides}
  end

  describe 'methods' do
    it "#alphabetical_rides" do
      hershey = AmusementPark.create!(name: "Hershey Park", admission_price: 50)
      lightning_racer = Ride.create!(name: "Lightning Racer", thrill_rating: 9, amusement_park_id: hershey.id)
      storm_runner = Ride.create!(name: "Storm Runner", thrill_rating: 7, amusement_park_id: hershey.id)
      great_bear = Ride.create!(name: "The Great Bear", thrill_rating: 2, amusement_park_id: hershey.id)

      expect(hershey.alphabetical_rides[0].name).to eq(lightning_racer.name)
      expect(hershey.alphabetical_rides[1].name).to eq(storm_runner.name)
      expect(hershey.alphabetical_rides[2].name).to eq(great_bear.name)
    end

    it "#average_thrill_rating" do
      hershey = AmusementPark.create!(name: "Hershey Park", admission_price: 50)
      lightning_racer = Ride.create!(name: "Lightning Racer", thrill_rating: 9, amusement_park_id: hershey.id)
      storm_runner = Ride.create!(name: "Storm Runner", thrill_rating: 7, amusement_park_id: hershey.id)
      great_bear = Ride.create!(name: "The Great Bear", thrill_rating: 2, amusement_park_id: hershey.id)

      expect(hershey.average_thrill_rating).to eq(6)
    end

  end

end
