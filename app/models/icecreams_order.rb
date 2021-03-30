class IcecreamsOrder < ActiveRecord::Base
    belongs_to :icecream
    belongs_to :order
    
    def calculate_total
        total = self.icecream.price*self.quantity
        self.total = total
    end
end