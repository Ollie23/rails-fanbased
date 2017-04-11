class GamesController < ApplicationController

  def index

    # @sorted_games = sort_week
    @games = Game.paginate(:page => params[:page], :per_page => 10)

    # @sorted_games = Post.paginate(:page => params[:page])

    # @games = Game.all.order('created_at DESC').group_by(&:date_time)
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

  def sort_week
    array = []
    Game.all.each do |game|
      if game.date_time > Date.today and game.date_time < Date.today + 7
        array << game
      end
    array
    end
  end

  private

  def game_params
    params.require(:game).permit(:date_time, :location, :gameweek, :home_team_id, :away_team_id, :league_id)
  end
end
