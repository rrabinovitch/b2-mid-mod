require 'rails_helper'

RSpec.describe Mechanic do
  # Mechanics have a name and years of experience

  describe 'relationships' do
    it {should have_many :mechanic_rides}
    it {should have_many(:rides).through(:mechanic_rides)}
  end

  describe 'methods' do
    it "#ride_names" do
      hershey = AmusementPark.create!(name: "Hershey Park", admission_price: 50)

      kara = Mechanic.create!(name: "Kara Smith", years_of_experience: 11)

      lightning_racer = Ride.create!(name: "Lightning Racer", thrill_rating: 9, amusement_park_id: hershey.id)
      storm_runner = Ride.create!(name: "Storm Runner", thrill_rating: 7, amusement_park_id: hershey.id)
      great_bear = Ride.create!(name: "The Great Bear", thrill_rating: 2, amusement_park_id: hershey.id)

      MechanicRide.create!(mechanic_id: kara.id, ride_id: lightning_racer.id)
      MechanicRide.create!(mechanic_id: kara.id, ride_id: storm_runner.id)
      MechanicRide.create!(mechanic_id: kara.id, ride_id: great_bear.id)

      expect(kara.ride_names).to eq([lightning_racer.name, storm_runner.name, great_bear.name])
    end
  end
end
