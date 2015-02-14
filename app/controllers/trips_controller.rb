class TripsController < ApplicationController

  def index
    @profile = Profile.find(current_user.id)

    @trips = Trip.all
    @trips = @trips.destination(params[:destination]) if params[:destination].present?
    @trips = @trips.gender(params[:gender]) if params[:gender].present?

    @trips = @trips.sort_by &:end_date
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user_id = current_user.id

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully addded to yo itinerary!' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:user_id, :destination, :start_date, :end_date)
  end

end
