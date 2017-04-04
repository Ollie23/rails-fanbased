class TeamsController < ApplicationController
  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to teams_path
    else
      render :new
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    @team.update(team_params)
    redirect_to teams_path(@team)
  end

  def destroy
  end

  private

  def team_params
    params.require(:team).permit(:name, :location, :stadium, :abbreviation)
  end
end
