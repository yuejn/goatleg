class ProfilesController < ApplicationController
  # before_action :authenticate_user!

  def index
    @profiles = Profile.all
  end

  def show

    @profile = Profile.find(params[:id])
     byebug
  end
  
  def register
    @profile = Profile.new
    @profile.user_id = 1 
    # @profile.user_id = current_user.id
  end

  def create
    @profile = Profile.new(profile_params) 
    
    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile}
      else
        format.html { render :register}
      end
    end
  end


private
  def profile_params
      params.require(:profile).permit(:user_id,:gender, :seeking_gender, :age)
    end

end
