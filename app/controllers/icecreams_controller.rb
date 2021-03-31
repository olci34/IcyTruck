class IcecreamsController < ApplicationController
    before_action :set_icecream, only: [:show, :edit, :destroy, :update]

    def new
    end

    def create
        icecream = Icecream.new(icecream_params)
        icecream.truck = current_truck
        if icecream.save
            redirect_to truck_path(current_truck)
        else
            redirect_to truck_path(current_truck), alert: "Invalid input"
        end
    end
    
    def show
    end

    def edit
    end

    def update
    end

    def destroy
        @icecream.delete
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