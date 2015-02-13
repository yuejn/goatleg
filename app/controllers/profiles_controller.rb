class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update]



  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
  end
  
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params) 
    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile}
      else
        # format.html { render :register}
      end
    end
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile}
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  private  
    def set_profile
        @profile = Profile.find_by(params[:user_id])
    end


private
  def profile_params
      params.require(:profile).permit(:user_id,:gender, :seeking_gender, :age)
    end

end
