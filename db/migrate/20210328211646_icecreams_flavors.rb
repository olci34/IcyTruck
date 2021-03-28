class IcecreamsFlavors < ActiveRecord::Migration[6.1]
  def change
    create_table :icecreams_flavors do |t|
      t.belongs_to :icecream
      t.belongs_to :truck
  end
end
