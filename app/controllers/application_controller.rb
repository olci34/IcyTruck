class ApplicationController < ActionController::Base
    
    helper_method :current_truck, :current_customer

    def current_truck
        case session[:user]
        when "truck"
            if session[:truck_id] == params[:id]                    # to view truck's own menu
                @truck = Truck.find_by(id: session[:truck_id])
            else                                                    # to view other truck's menu
                @truck = Truck.find_by(id: params[:id])
            end
        when "customer"
            if params[:id]                                          # to view truck's menu as a Customer
                @truck = Truck.find_by(id: params[:id])
            elsif params[:truck_id]                                 # to view truck's menu in Order page
                @truck = Truck.find_by(id: params[:truck_id])
            elsif session[:picked_truck_id]
                @truck = Truck.find_by(id: session[:picked_truck_id]) # to assign truck_id to new Order
            end
        end 
    end

    def current_customer
        @customer = Customer.find_by(id: session[:customer_id]) if session[:customer_id]
    end
    
end
