class DestinationsController < ApplicationController
  #helper_method :my_recent_posts, :most_popular_post, :average_age_of_my_bloggers

  def index
    @destinations = Destination.all
  end

  def show
    @destination = Destination.find(params[:id])
  end
end
