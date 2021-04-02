class Icecream < ApplicationRecord
    belongs_to :truck
    has_many :icecreams_orders
    has_many :orders, through: :icecreams_orders
    has_and_belongs_to_many :flavors
    validates :name, uniqueness: { scope: :truck_id, message: "Can't have same name icecreams in your menu"}, presence: true
    after_destroy :cancel_orders_upon_delete
    # accepts_nested_attributes_for :flavors

    def flavors_attributes=(attributes)
        attributes.values.each do |attribute|
            if !attribute[:name].strip.empty?
                flavor = Flavor.find_or_create_by(attribute) do |fl|
                    self.flavors << fl
                end
            end
            self.save
        end
    end

    private

    def cancel_orders_upon_delete # To make sure to Orders of a deleted icecream
        Order.joins(:icecreams_orders).where("icecream_id = ?",self.id).destroy_all
        IcecreamsOrder.where("icecream_id = ?", self.id).destroy_all
    end

    def self.search_icecreams_by_flavor(flavor_name, truck)
        flavor = Flavor.where("name = ?", flavor_name).first
        if flavor_name == "Menu"
            self.where("truck_id = ?", truck.id)
        else
            truck.icecreams.select {|ic| ic.flavor_ids.include?(flavor.id)}
        end
    end

end
