require 'rails_helper'

RSpec.describe 'When I visit an amusement park’s show page' do
  it "I see the name and price of admissions for that amusement park" do
    hershey = AmusementPark.create!(name: "Hershey Park", admission_price: 50)

    visit "/amusement_parks/#{hershey.id}"

    expect(page).to have_content(hershey.name)
    expect(page).to have_content("Admissions: $#{hershey.admission_price}")
    # figure out how to test for admission price view format better
  end

  it "I see the names of all the rides that are at that theme park listed in alphabetical order" do
    hershey = AmusementPark.create!(name: "Hershey Park", admission_price: 50)
    lightning_racer = Ride.create!(name: "Lightning Racer", thrill_rating: 9, amusement_park_id: hershey.id)
    storm_runner = Ride.create!(name: "Storm Runner", thrill_rating: 7, amusement_park_id: hershey.id)
    great_bear = Ride.create!(name: "The Great Bear", thrill_rating: 2, amusement_park_id: hershey.id)

    visit "/amusement_parks/#{hershey.id}"

    within '.rides' do
      expect(page.all('li')[0]).to have_content(lightning_racer.name)
      expect(page.all('li')[1]).to have_content(storm_runner.name)
      expect(page.all('li')[2]).to have_content(great_bear.name)
    end
  end

  it "I see the average thrill rating of this amusement park’s rides" do
    hershey = AmusementPark.create!(name: "Hershey Park", admission_price: 50)
    lightning_racer = Ride.create!(name: "Lightning Racer", thrill_rating: 9, amusement_park_id: hershey.id)
    storm_runner = Ride.create!(name: "Storm Runner", thrill_rating: 7, amusement_park_id: hershey.id)
    great_bear = Ride.create!(name: "The Great Bear", thrill_rating: 2, amusement_park_id: hershey.id)

    visit "/amusement_parks/#{hershey.id}"

    expect(page).to have_content("Average thrill rating: 6.0/10")
  end
end
