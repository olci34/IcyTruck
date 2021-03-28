class TrucksController < ApplicationController
    before_action :truck_owner, only: [:index]
    def new
        @truck = Truck.new
    end

    def create
        truck = Truck.new(truck_params)
        if truck.save
            session[:truck_id] = truck.id
            redirect_to trucks_path
        else
            redirect_to new_truck_path
        end
    end

    def index
        @trucks = Truck.all
    end

    private

    def truck_params
        params.require(:truck).permit(:name, :email, :password, :zipcode)
    end

    def truck_owner
        @truck_owner = Truck.find_by(id: session[:truck_id]).email if session[:truck_id]
    end

end