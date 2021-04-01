class TrucksController < ApplicationController

    before_action :current_truck, except: [:new, :create, :show]

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
        if session[:user] == "customer"
            @customer = Customer.find_by(id: params[:customer_id])
            @trucks = Truck.in_the_area_of(@customer.zipcode)
        else
            @trucks = Truck.in_the_area_of(@truck.zipcode)
        end
    end

    def show
        @truck = Truck.find_by(id: params[:id])
        if params[:flavors] # If a flavor is searched
            @icecreams = Icecream.search_icecreams_by_flavor(params[:flavors][:flavor_name], @truck)
        else
            @icecreams = Icecream.where("truck_id = ?", @truck.id)
        end
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

end