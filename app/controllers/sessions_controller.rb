class SessionsController < ApplicationController

    def truck_login
        session[:user] = "truck"
    end

    def login
        session[:user] = "customer"
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
        elsif params[:customer]
            customer = Customer.find_by_email(params[:customer][:email])
            if customer && customer.authenticate(params[:customer][:password])
                session[:customer_id] = customer.id
                redirect_to customers_path
            else
                redirect_to login_path, alert: "Invalid customer email or password"
            end
        end
    end

    def create_via_fb
        if session[:user] == "truck"
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
        elsif session[:user] == "customer"
            customer = Customer.find_or_create_by(email: request.env['omniauth.auth']['info']['email']) do |t|
                t.name = request.env['omniauth.auth']['info']['name']
                t.password = "password"
            end
            if customer.save
                session[:customer_id] = customer.id
                redirect_to customers_path
            else
                redirect_to signup_path
            end
        end
    end

    def destroy
        if session[:truck_id]
            truck = Truck.find_by(id: session[:truck_id])
            truck.online = false
            truck.save
            session.clear
            redirect_to truck_login_path
        elsif session[:customer_id]
            session.clear
            redirect_to login_path
        end
    end

end