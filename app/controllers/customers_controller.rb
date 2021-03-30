class CustomersController < ApplicationController

    before_action :current_customer, except: [:new, :create]

    def new
        session[:user] = "customer"
        @customer = Customer.new
    end

    def create
        customer = Customer.new(customer_params)
        if customer.save
            session[:customer_id] = customer.id
            redirect_to customers_path
        else
            redirect_to signup_path, alert: "Invalid email or password"
        end
    end

    def index
        @trucks = Truck.in_the_area_of(@customer.zipcode)
    end

    def show
    end

    def edit
    end

    def update
        @customer.update(customer_params)
        redirect_to customers_path
    end

    def wallet
    end

    def update_wallet
        @customer.add_money(params[:customer][:wallet])
        redirect_to wallet_path
    end


    private
    
    def customer_params
        params.require(:customer).permit(:name,:email,:password,:zipcode)
    end

end