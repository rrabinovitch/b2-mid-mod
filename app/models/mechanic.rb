class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def ride_names
    rides.pluck(:name)
  end
end
