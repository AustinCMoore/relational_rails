class FishController < ApplicationController
  def index
    @fishies = Fish.all
  end

  def show
    @fish = Fish.find(params[:id])
  end

  def edit 
    @fish = Fish.find(params[:id])
  end

  def update
    @fishies = Fish.find(params[:id])
    @fishies.update( 
      name: params[:name], 
      quantity: params[:quantity],
      bioluminescent: params[:bioluminescent]
    )
    redirect_to "/fish/#{@fishies.id}"
  end
end