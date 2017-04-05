class LeaguesController < ApplicationController
  def index
    @leagues = League.all
  end

  def show
    @league = League.find(params[:id])
  end

  def create
    @league = League.new(league_params)
    @league.save

    redirect_to root_path
  end

  def update
    @league = League.find(params[:id])
    @league.update(league_params)
    redirect_to league_path(@league)
  end

  def destroy
    @league = league.find(params[:id]).destroy
    redirect_to root_path
  end

  private

   def league_params
    params.require(:league).permit(:name, :country)
  end
end

