class DockBoatsController < ApplicationController
  def index
    @dock = Dock.find(params[:dock_id])
    if params[:sort] == 'asc'
      if params[:number] != nil
        @boats = @dock.boats.alphabetize.greater_than(params[:number])
      else
        @boats = @dock.boats.alphabetize
      end
    else
      if params[:number] != nil
        @boats = @dock.boats.greater_than(params[:number])
      else
        @boats = @dock.boats
      end
    end
  end

  def new
    @dock = Dock.find(params[:dock_id])
  end

  def create
    @dock = Dock.find(params[:dock_id])
    @boats = @dock.boats.create(
      name: params[:name],
      motor_powered: params[:motor_powered],
      crew_size: params[:crew_size]
    )
    redirect_to "/docks/#{@dock.id}/boats"
  end
end
