class OrdersController < ApplicationController
    before_action :current_truck, :current_customer
    def new
        @order = Order.new
        @truck.icecreams.each do |i|
            @order.icecreams_orders.build(icecream_id: i.id)
        end
        session[:picked_truck_id] = @truck.id
    end
    
    def index
    end

    def create
        order = Order.new(order_params)
        order.customer = @customer
        order.truck = @truck
        order.update_total
        binding.pry
        if order.save
            redirect_to truck_path(@truck), alert: "Order is placed successfully"
        else
            redirect_to truck_path(@truck), alert: "Something went wrong. #{order.errors.full_messages.to_sentence}"
        end
    end

    def show
    end

    private

    def order_params
        params.require(:order).permit(:truck_id, :customer_id, icecreams_orders_attributes: [:quantity, :icecream_id])
    end

end