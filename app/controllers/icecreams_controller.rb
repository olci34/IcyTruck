class IcecreamsController < ApplicationController
    before_action :set_icecream, only: [:show, :edit, :destroy, :update]
    before_action :set_truck

    def new
        @icecream = Icecream.new
    end

    def create
        icecream = Icecream.new(icecream_params)
        icecream.truck = @truck
        if icecream.save
            redirect_to truck_path(@truck)
        else
            redirect_to truck_path(@truck), alert: "Invalid input"
        end
    end
    
    def show
    end

    def edit
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