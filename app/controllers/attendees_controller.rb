class AttendeesController < ApplicationController
  def create
    @attendee = Attendee.new(att_params)
     @attendee.save!
    redirect_to root_path
  end

  private

  def att_params
    params.require(:attendee).permit(:event_id, :user_id)
  end

end
