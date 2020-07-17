class MechanicRidesController < ApplicationController
  def new
    @mechanic = Mechanic.find(params[:id])
  end

  def create
    mechanic_id = params[:id]
    MechanicRide.create(mechanic_id: mechanic_id, ride_id: params[:ride_id])
    redirect_to "/mechanics/#{mechanic_id}"
  end
end
