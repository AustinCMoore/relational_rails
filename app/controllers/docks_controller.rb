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

  def edit
    @dock = Dock.find(params[:id])
  end

  def update
    @dock = Dock.find(params[:id])
    @dock.update(
      name: params[:name],
      open: params[:open],
      capacity: params[:capacity]
    )
    redirect_to "/docks/#{@dock.id}"
  end

  def show
    @dock = Dock.find(params[:id])
  end

  def destroy
    @dock = Dock.find(params[:id])
    @dock.destroy
    redirect_to "/docks"
  end
end
