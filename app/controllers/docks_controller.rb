class DocksController < ApplicationController
  def index
    @docks = Dock.all
    # require "pry" ; binding.pry
  end
end
