class AquariumFishController < ApplicationController
  def index
    @aquarium = Aquarium.find(params[:aquarium_id])
    @fishies = @aquarium.fish
  end
end 