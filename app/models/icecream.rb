class Icecream < ApplicationRecord
    belongs_to :truck
    has_many :icecreams_orders
    has_many :orders, through: :icecreams_orders
    has_and_belongs_to_many :flavors
    validates :name, uniqueness: { scope: :truck_id, message: "Can't have same name icecreams in your menu"}, presence: true
    # accepts_nested_attributes_for :flavors

    def flavors_attributes=(attributes)
        attributes.values.each do |attribute|
            flavor = Flavor.find_or_create_by(attribute) do |fl|
                self.flavors << fl
            end
            self.save
        end
    end
end
