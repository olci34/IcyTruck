class CustomersController < ApplicationController

    def new
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
        @trucks = Truck.all
    end

    def show
    end


    private
    
    def customer_params
        params.require(:customer).permit(:name,:email,:password,:zipcode)
    end

end