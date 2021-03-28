class Customer < ApplicationRecord
    has_many :orders
    has_many :trucks, through: :orders
    has_secure_password
end
