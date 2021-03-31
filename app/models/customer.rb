class Customer < ApplicationRecord
    has_many :orders
    has_many :trucks, through: :orders
    has_secure_password

    def add_money(amount)
        self.wallet += amount.to_i
        self.save
    end

    def reduce_money(amount)
        self.wallet -= amount
        self.save
    end

end
