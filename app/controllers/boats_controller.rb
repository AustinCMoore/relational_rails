class BoatsController < ApplicationController
  def index
    @boats = Boat.is_motor_powered
  end

  def show
    @boat = Boat.find(params[:id])
  end

  def edit
    @boat = Boat.find(params[:id])
  end

  def update
    @boat = Boat.find(params[:id])
    @boat.update(
      name: params[:name],
      motor_powered: params[:motor_powered],
      crew_size: params[:crew_size]
    )
    redirect_to "/boats/#{@boat.id}"
  end

  def destroy
    @boat = Boat.find(params[:id])
    @boat.destroy
    redirect_to "/boats"
  end
end
