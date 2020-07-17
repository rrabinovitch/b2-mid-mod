require 'rails_helper'

RSpec.describe AmusementPark do
  # Amusement Parks have a name and admission price
  describe 'relationships' do
    it {should have_many :rides}
  end
end
