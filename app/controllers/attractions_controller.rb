class AttractionsController < ApplicationController
  load_and_authorize_resource
  def index
    @attraction = Attraction.new
    @ride = Ride.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def update
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private
  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end


end