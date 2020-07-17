require 'rails_helper'

RSpec.describe Mechanic do
  # Mechanics have a name and years of experience

  describe 'relationships' do
    it {should have_many :mechanic_rides}
    it {should have_many(:rides).through(:mechanic_rides)}
  end
end
