class Order < ApplicationRecord
    belongs_to :customer
    belongs_to :truck
    has_many :icecreams,through: :icecreams_orders
    has_many :icecreams_orders
    validate :order_valid?
    # accepts_nested_attributes_for :icecreams_orders
    
    def icecreams_orders_attributes=(attributes)
        attributes.values.each do |attribute|
            if !attribute[:quantity].strip.empty? ### had to add it because customer leaves empty quantities in form for
                icecreams_order = IcecreamsOrder.create(attribute)
                icecreams_order.calculate_total
                self.icecreams_orders << icecreams_order
            end
        end
    end

    def update_total
        self.total = self.icecreams_orders.map {|io| io.total}.sum
    end

    def order_valid?
        self.total <= self.customer.wallet || self.errors.add(:total, "is higher than your balance")
    end

end
