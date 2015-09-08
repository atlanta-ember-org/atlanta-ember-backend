class VenuesController < ApplicationController

  def show
    @topic = Venue.find(params[:id])
    render json: @topic
  end
end
