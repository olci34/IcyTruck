class IcecreamsController < ApplicationController
    before_action :set_icecream, only: [:show, :edit, :destroy, :update]
    before_action :current_customer, only: [:show, :edit]
    before_action :set_truck
    before_action :redirect_if_not_logged_in

    def new
        redirect_to new_truck_icecream_path(current_truck) if !check_owner? # Avoids creating new icecreams for other trucks
        @icecream = Icecream.new
        but_not_menu = Flavor.where("name = ?", "Menu")
        @flavors = Flavor.all - but_not_menu
    end

    def create
        @icecream = Icecream.new(icecream_params)
        @icecream.truck = @truck
        if @icecream.save
            redirect_to truck_path(@truck)
        else
            but_not_menu = Flavor.where("name = ?", "Menu")
            @flavors = Flavor.all - but_not_menu
            render :new
        end
    end
    
    def show
        if !@icecream
            redirect_truck_index
        end
    end

    def edit
        if session[:user] == "truck"
            redirect_to trucks_path, alert: "Sorry. This icecream is not your truck's." if !check_owner?
            but_not_menu = Flavor.where("name = ?", "Menu") # To not show Menu as a option in collection box
            @flavors = Flavor.all - but_not_menu
        else session[:user] == "customer"
            redirect_to customer_trucks_path(@customer), alert: "Only Truck can edit an icecream."
        end
    end

    def update
        if @icecream.update(icecream_params)
            redirect_to truck_path(current_truck)
        end
    end

    def destroy
        @icecream.destroy
        redirect_to truck_path(current_truck)
    end


    private

    def icecream_params
        params.require(:icecream).permit(:name, :price, :flavor_ids => [], flavors_attributes: [:name])
    end

    def set_icecream
        @icecream = Icecream.find_by(id: params[:id])
    end

end