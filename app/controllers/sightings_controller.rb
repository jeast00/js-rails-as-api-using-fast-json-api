class SightingsController < ApplicationController

  def index
    sightings = Sighting.all 
    render json: SightingSerializer.new(sightings)
  end

  def show
    sighting = Sighting.find(params[:id])

    # set up an options hash when serializing relationship models ex. bird and location for sightings
    options = {
      include: [:bird, :location]
    }
    render json: SightingSerializer.new(sighting, options) # pass in the sighting variable and the options hash
  end
end
