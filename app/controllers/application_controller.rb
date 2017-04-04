class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def index
    @game = Game.all
  end
  def show
    @game = Game.find(params[:id])
  end
  def new
    @game = Game.new
  end
  def create
    @game = Game.new(profile_params)
    if @game.save
      redirect_to root_path
    else
      render :new
    end
  end
  def edit
    @game = Profile.find(params[:id])
  end

  def update
    @pgame = Profile.find(params[:id])
    @game.update(profile_params)
    redirect_to profile_path(@game)
  end

  def destroy
    @game = Profile.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def profile_params
    params.require(:profile).permit(:date_time, :location, :gameweek)
  end
end
