class GamesController < ApplicationController

  def index

    #@sorted_games = sort_week


    @games = future_games.paginate(:page => params[:page], :per_page => 18).order("date_time ASC")

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
    Game.where("date_time >= ? AND date_time <= ?", Date.today.at_beginning_of_week, Date.today.end_of_week)
  end

  def future_games
    Game.where("date_time >= ?", Date.today)
  end

  private

  def game_params
    params.require(:game).permit(:date_time, :location, :gameweek, :home_team_id, :away_team_id, :league_id)
  end
end
