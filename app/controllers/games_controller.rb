class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
    redirect_to root_path
    end
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)
    redirect_to game_path(@game)
  end

  def destroy
    @game = game.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def game_params
    params.require(:game).permit(:date_time, :location, :gameweek, :home_team_id, :away_team_id, :league_id)
  end
end
