class AquariumsController < ApplicationController
  def index
    @aquariums = Aquarium.all
  end

  def show
    @aquarium = Aquarium.find(params[:id])
  end
end