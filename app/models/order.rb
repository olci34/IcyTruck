class Order < ApplicationRecord
    belongs_to :customer
    belongs_to :truck
    has_many :icecreams,through: :icecreams_orders
    has_many :icecreams_orders
end
