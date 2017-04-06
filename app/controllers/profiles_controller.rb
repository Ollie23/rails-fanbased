class ProfilesController < ApplicationController
  def show
      @profile = Profile.find(params[:id])
  end
  # def new
  #   @profile = Profile.new
  # end
  # def create
  #   @profile = Profile.new(profile_params)
  #   @profile.user = current_user
  #   if @profile.save
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end
  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
    redirect_to teams_path
  end

  def destroy
    @profile = Profile.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def profile_params
    params.require(:profile).permit(:username, :first_name, :last_name, :age)
  end
end
