class FishController < ApplicationController
  def index
    @fishies = Fish.all
  end
end