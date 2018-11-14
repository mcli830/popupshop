class VenuesController < ApplicationController
  def index
    @venues = Venue.all
    @venues = Venue.where.not(latitude: nil, longitude: nil)

    @markers = @venues.map do |venue|
      {
        lng: venue.longitude,
        lat: venue.latitude
      }
    end
  end

  def show
    @venue = Venue.find(params[:id])
    @event = Event.new
  end
end
