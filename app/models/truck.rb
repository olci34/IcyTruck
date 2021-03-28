class Truck < ApplicationRecord
    has_many :orders
    has_many :customers, through: :orders
    has_many :icecreams
    has_secure_password
end
