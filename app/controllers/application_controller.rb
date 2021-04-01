class ApplicationController < ActionController::Base
    
    helper_method :current_truck, :current_customer

    def current_truck
        @truck = Truck.find_by(id: session[:truck_id])
    end

    def set_truck
        case session[:user]
        when "truck"
            @truck = Truck.find_by(id: params[:truck_id])
        when "customer"
            if params[:truck_id]
                @truck = Truck.find_by(id: params[:truck_id])
            else
                @truck = Truck.find_by(id: params[:id])
            end
        end
    end

    def current_customer
        @customer = Customer.find_by(id: session[:customer_id]) if session[:customer_id]
    end

    def logged_in?
        case session[:user]
        when "truck"
            session[:truck_id]
        when "customer"
            session[:customer_id]
        end
    end
end
