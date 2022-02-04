class DocksController < ApplicationController
  def index
    @docks = Dock.all
  end

  def show
    @dock = Dock.find(params[:id])
  end
end
