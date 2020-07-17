require 'rails_helper'

RSpec.describe 'When I go to a mechanics show page' do
  it "I see their name, years of experience, and names of all rides they’re working on" do
    hershey = AmusementPark.create!(name: "Hershey Park", admission_price: 50)

    kara = Mechanic.create!(name: "Kara Smith", years_of_experience: 11)

    lightning_racer = Ride.create!(name: "Lightning Racer", thrill_rating: 9, amusement_park_id: hershey.id)
    storm_runner = Ride.create!(name: "Storm Runner", thrill_rating: 7, amusement_park_id: hershey.id)
    great_bear = Ride.create!(name: "The Great Bear", thrill_rating: 2, amusement_park_id: hershey.id)

    MechanicRide.create!(mechanic_id: kara.id, ride_id: lightning_racer.id)
    MechanicRide.create!(mechanic_id: kara.id, ride_id: storm_runner.id)
    MechanicRide.create!(mechanic_id: kara.id, ride_id: great_bear.id)

    visit "/mechanics/#{kara.id}"

    expect(page).to have_content("Mechanic: #{kara.name}")
    expect(page).to have_content("Years of experience: #{kara.years_of_experience}")
    expect(page).to have_content("Current rides in workload: #{lightning_racer.name}, #{storm_runner.name}, #{great_bear.name}")
  end

  it "I also see a form to add a ride to their workload
      When I fill in that field with an id of an existing ride and hit submit
      I’m taken back to that mechanics show page
      And I see the name of that newly added ride on this mechanics show page" do
    hershey = AmusementPark.create!(name: "Hershey Park", admission_price: 50)

    kara = Mechanic.create!(name: "Kara Smith", years_of_experience: 11)
    lightning_racer = Ride.create!(name: "Lightning Racer", thrill_rating: 9, amusement_park_id: hershey.id)
    storm_runner = Ride.create!(name: "Storm Runner", thrill_rating: 7, amusement_park_id: hershey.id)

    MechanicRide.create!(mechanic_id: kara.id, ride_id: lightning_racer.id)
    MechanicRide.create!(mechanic_id: kara.id, ride_id: storm_runner.id)

    # to be added to workload via form
    great_bear = Ride.create!(name: "The Great Bear", thrill_rating: 2, amusement_park_id: hershey.id)

    visit "/mechanics/#{kara.id}"
    expect(page).to_not have_content(great_bear.name)

    click_on "Add Ride"

    fill_in :ride_id, with: great_bear.id
    click_on "Submit"

    expect(current_path).to eq("/mechanics/#{kara.id}")
    expect(page).to have_content("Current rides in workload: #{lightning_racer.name}, #{storm_runner.name}, #{great_bear.name}")
  end
end
