class TrucksController < ApplicationController

    before_action :current_truck, only: [:index, :edit, :update, :show]

    def new
        @truck = Truck.new
    end

    def create
        truck = Truck.new(truck_params)
        if truck.save
            session[:truck_id] = truck.id
            redirect_to trucks_path
        else
            redirect_to truck_signup_path
        end
    end

    def index
        @trucks = Truck.all
    end

    def show
    end

    def edit
    end

    def update
        @truck.update(truck_params)
        redirect_to trucks_path
    end

    private

    def truck_params
        params.require(:truck).permit(:name, :email, :password, :zipcode)
    end

    def current_truck
        @truck = Truck.find_by(id: session[:truck_id]) if session[:truck_id]
    end

end