class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.new(game_params)
    @game.save

    redirect_to root_path
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
    params.require(:game).permit(:name, :country)
  end
end
