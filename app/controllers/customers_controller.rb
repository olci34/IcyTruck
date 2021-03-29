class CustomersController < ApplicationController

    def new
        @customer = Customer.new
    end

    def create

    end

    def index
        @trucks = Truck.where()
    end

    def show
    end

end