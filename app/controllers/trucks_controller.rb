class TrucksController < ApplicationController

    def new
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

end