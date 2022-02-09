class AquariumFishController < ApplicationController
  def index
    @aquarium = Aquarium.find(params[:aquarium_id])
    @fishies = @aquarium.fish
  end

  def new
    @aquarium = Aquarium.find(params[:aquarium_id])
  end

  def create
    @aquarium = Aquarium.find(params[:aquarium_id])
    @fish = @aquarium.fish.create(
      name: params[:name],
      quantity: params[:quantity],
      bioluminescent: params[:bioluminescent]
    )
    redirect_to "/aquariums/#{@aquarium.id}/fish"
  end
end 