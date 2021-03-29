class SessionsController < ApplicationController

    def truck_login
    end

    def create
        if params[:truck] ### use partial render locals later
            truck = Truck.find_by_email(params[:truck][:email])
            if truck && truck.authenticate(params[:truck][:password])
                session[:truck_id] = truck.id
                truck.update(online: true)
                redirect_to trucks_path
            else
                redirect_to truck_login_path, alert: "Invalid email or password"
            end
        end
    end

    def create_via_fb
        truck = Truck.find_or_create_by(email: request.env['omniauth.auth']['info']['email']) do |t|
            t.name = "#{request.env['omniauth.auth']['info']['name']}'s Icecream Truck"
            t.password = "password"
        end
        if truck.save
            truck.update(online: true) if truck.online == false
            session[:truck_id] = truck.id
            redirect_to trucks_path
        else
            redirect_to truck_signup_path
        end
    end

    def destroy
        truck = Truck.find_by(id: session[:truck_id]) if session[:truck_id]
        truck.online = false
        truck.save
        session.clear
        redirect_to truck_signup_path
    end

end