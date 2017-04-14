class AttendeesController < ApplicationController
  def create


    @attendee = Attendee.new(att_params)
     @attendee.save!
     @event = Event.find(@attendee.event_id)
    redirect_to venue_path(@event.venue_id)
  end

  private

  def att_params
    params.require(:attendee).permit(:event_id, :user_id)
  end

end
