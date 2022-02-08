class DocksController < ApplicationController
  def index
    @docks = Dock.all
  end

  def new

  end

  def create
    Dock.create(
      name: params[:name],
      open: params[:open],
      capacity: params[:capacity]
    )
    redirect_to '/docks'
  end

  def show
    @dock = Dock.find(params[:id])
  end
end
