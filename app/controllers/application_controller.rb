class ApplicationController < ActionController::Base
    
    helper_method :current_truck, :current_customer

    def current_truck
        if session[:truck_id]
            @truck = Truck.find_by(id: session[:truck_id])
        elsif session[:customer_id]
            @truck = Truck.find_by(id: params[:id])
        end
    end

    def current_customer
        @customer = Customer.find_by(id: session[:customer_id]) if session[:customer_id]
    end
    
end
