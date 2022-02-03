class DocksController < ApplicationController
  def index
    @docks = Dock.all
  end
end
