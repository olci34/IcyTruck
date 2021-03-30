class Truck < ApplicationRecord
    has_many :orders
    has_many :customers, through: :orders
    has_many :icecreams
    has_secure_password

    scope :in_the_area_of, ->(zipcode) {where('zipcode == ?', zipcode)}
end
