class FishController < ApplicationController
  def index
    @fishies = Fish.where(bioluminescent: true)
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

  def destroy
    @fish = Fish.find(params[:id])
    @fish.destroy
    redirect_to "/fish"
  end
end