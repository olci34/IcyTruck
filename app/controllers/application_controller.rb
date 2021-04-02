class ApplicationController < ActionController::Base
    
    helper_method :current_truck, :current_customer, :check_owner?

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

    def redirect_if_not_logged_in
        redirect_to root_path, alert: "You must signup or log in" if !logged_in?
    end

    def check_owner?
        case session[:user]
        when "truck"
            params[:truck_id] ? session[:truck_id] == params[:truck_id].to_i : session[:truck_id] == params[:id].to_i
        when "customer"
            params[:customer_id] ? session[:customer_id] == params[:customer_id].to_i : session[:customer_id] == params[:id].to_i
        end
    end
end
