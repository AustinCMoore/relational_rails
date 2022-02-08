class AquariumsController < ApplicationController
  def index
    @aquariums = Aquarium.all
  end

  def show
    @aquarium = Aquarium.find(params[:id])
  end

  def new 
  end

  def create
    Aquarium.create(
      name: params[:name],
      clean: params[:clean],
      number_of_types: params[:number_of_types]
    )
    redirect_to '/aquariums'
  end
end