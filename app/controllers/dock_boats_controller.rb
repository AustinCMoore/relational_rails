class DockBoatsController < ApplicationController
  def index
    dock = Dock.find(params[:dock_id])
    @boats = dock.boats
  end
end
