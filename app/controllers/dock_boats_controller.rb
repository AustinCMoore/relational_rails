class DockBoatsController < ApplicationController
  def index
    @dock = Dock.find(params[:dock_id])
    @boats = @dock.boats
  end

  def new
  end

  def create
    @dock = Dock.first
    @boats = @dock.boats.create(
      name: params[:name],
      motor_powered: params[:motor_powered],
      crew_size: params[:crew_size]
    )
    redirect_to "/docks/#{@dock.id}/boats"
  end
end
