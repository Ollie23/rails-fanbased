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

    # change team to teams, readability!
    if current_user
    @arr = {}
    current_user.team.each_with_index do |team, index|
      @arr[team.name] =  team.games.select { |game| game.date_time >= Date.today }
    end
  end
  end
end
