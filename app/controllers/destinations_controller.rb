class DestinationsController < ApplicationController
    def index
        @destinations = Destination.all
    end

    def show
        @destination = Destination.find(params[:id])
    end
    def new
        @destination = Destination.new
    end
    def create
        @destination = Destination.create(destination_params[:destination])
        redirect_to @destination
    end
    def edit
        @destination = Destination.find(params[:id])
    end
    def update
        @destination = Destination.find(params[:id])
        @destination.update(destination_params[:destination])
        redirect_to @destination        
    end
    def destination_params
        params.permit(destination: [:name, :country])
    end
end
