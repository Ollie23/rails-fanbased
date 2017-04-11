class PagesController < ApplicationController
  def home
    @venues = Venue.all
    @venues.each do |venue|
      @venue_coordinates = { lat: venue.latitude, lng: venue.longitude }
    end
    @venues = Venue.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@venues) do |venue, marker|
      marker.lat venue.latitude
      marker.lng venue.longitude
    end
  end
end
