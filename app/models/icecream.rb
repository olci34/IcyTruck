class Icecream < ApplicationRecord
    belongs_to :truck
    has_and_belongs_to_many :flavors
end