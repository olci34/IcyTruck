class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :items
      t.integer :total
      t.boolean :confirmed, default: false
      t.boolean :delivered, default: false
      t.integer :truck_id
      t.integer :customer_id
      t.timestamp :time
    end
  end
end
