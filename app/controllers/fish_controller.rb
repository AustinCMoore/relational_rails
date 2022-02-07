class FishController < ApplicationController
  def index
    @fishies = Fish.all
  end

  def show
    @fish = Fish.find(params[:id])
  end
end