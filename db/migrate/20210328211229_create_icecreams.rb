class CreateIcecreams < ActiveRecord::Migration[6.1]
  def change
    create_table :icecreams do |t|
      t.string :name
      t.integer :price
      t.integer :truck_id

      t.timestamps
    end
  end
end
