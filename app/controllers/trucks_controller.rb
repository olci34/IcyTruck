class TrucksController < ApplicationController

    before_action :current_truck, except: [:new, :create]

    def new
        session[:user] = "truck"
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
        if session[:truck_id]
            @icecream = Icecream.new
            @icecream.flavors.build
        end
    end

    def edit
    end

    def update
        @truck.update(truck_params)
        redirect_to trucks_path
    end

    def menu_edit
    end

    private

    def truck_params
        params.require(:truck).permit(:name, :email, :password, :zipcode)
    end

end