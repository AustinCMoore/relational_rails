class FishController < ApplicationController
  def index
    @fishies = Fish.where(bioluminescent: true)
  end

  def show
    @fish = Fish.find(params[:id])
  end
end