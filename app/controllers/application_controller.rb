class ApplicationController < ActionController::Base
    
    helper_method :current_truck

    def home
    end

    def current_truck
        @truck = Truck.find_by(id: session[:truck_id]) if session[:truck_id]
    end
    
end
