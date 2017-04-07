class EventsController < ApplicationController

  def new
    @event = Event.new
    @venue = Venue.find(params[:venue_id])
    @leagues = League.all
  end

  def create
    @event = Event.new(event_params)
    @event.save!
    redirect_to new_venue_event_path(params[:venue_id])
  end

  def show
  end


  private

  def event_params
    params.permit(:game_id, :venue_id)
  end


end


