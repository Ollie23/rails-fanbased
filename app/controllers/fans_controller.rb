class FansController < ApplicationController

  def create
    @fan = Fan.new(fan_params)
     @fan.save!
    redirect_to teams_path
  end

  def destroy
    @team = Team.find(params[:team_id])
    @user = User.find(params[:id])
    @fan = Fan.where(team_id:@team, user_id: @user).first
    @fan.destroy
    redirect_to profile_path(current_user)
  end

  private

  def fan_params
    params.require(:fan).permit(:team_id, :user_id)
  end

end
