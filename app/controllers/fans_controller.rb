class FansController < ApplicationController

  def create
    @fan = Fan.new(fan_params)
     @fan.save!
    redirect_to teams_path
  end

  private

  def fan_params
    params.require(:fan).permit(:team_id, :user_id)
  end

end
