class SessionsController < ApplicationController

    def truck_login
    end

    def create
        if params[:truck] ### use partial render locals later
            truck = Truck.find_by_email(params[:truck][:email])
            binding.pry
            if truck && truck.authenticate(params[:truck][:password])
                session[:truck_id] = truck.id
                redirect_to trucks_path
            else
                redirect_to truck_login_path, alert: "Invalid email or password"
            end
        end
    end

    def destroy
        session.clear
        redirect_to new_truck_path
    end

end