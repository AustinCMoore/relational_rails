class DockBoatsController < ApplicationController
  def index
    @dock = Dock.find(params[:dock_id])
    @boats = @dock.boats
  end

  def new
  end
end
