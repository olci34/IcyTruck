class Customer < ApplicationRecord
    has_many :orders
    has_many :trucks, through: :orders
    has_secure_password

    def add_money(amount)
        binding.pry
        self.wallet += amount.to_i
        self.save
    end

end
