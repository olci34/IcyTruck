class TrucksController < ApplicationController
    before_action :current_customer, only: [:show] # for layout links
    before_action :current_truck, except: [:new, :create, :show]
    before_action :redirect_if_not_logged_in, only: [:index, :show, :edit, :update]

    def new
        redirect_to trucks_path if logged_in?
        session[:user] = "truck"
        @truck = Truck.new
    end

    def create
        @truck = Truck.new(truck_params)
        if @truck.save
            session[:truck_id] = @truck.id
            redirect_to trucks_path
        else
            render :new
        end
    end

    def index
        if session[:user] == "customer"
            redirect_to customer_trucks_path(current_customer) if !check_owner?
            @customer = Customer.find_by(id: params[:customer_id])
            @trucks = Truck.in_the_area_of(@customer.zipcode)
        else
            @trucks = Truck.in_the_area_of(@truck.zipcode)
        end
    end

    def show
        @truck = Truck.find_by(id: params[:id])
        if @truck && params[:flavors] # If a flavor is searched
            @icecreams = Icecream.search_icecreams_by_flavor(params[:flavors][:flavor_name], @truck)
        elsif @truck
            @icecreams = Icecream.where("truck_id = ?", @truck.id)
        else
            redirect_truck_index
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