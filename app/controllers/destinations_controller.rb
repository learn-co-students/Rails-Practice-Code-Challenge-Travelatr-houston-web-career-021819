class DestinationsController < ApplicationController
    def index
        @destinations = Destination.all
    end
    def show
        @destination = Destination.find(params[:id])
        @most_recent_posts = @destination.posts.sort_by { |post| post.created_at}.slice(0, 5)
        @blogger_avg = @destination.avg_blogger_age
        @featured_post = @destination.posts.sort_by {|post| post.likes}.last
        #byebug
    end
end   