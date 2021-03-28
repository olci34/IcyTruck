class CreateTrucks < ActiveRecord::Migration[6.1]
  def change
    create_table :trucks do |t|
      t.string :name
      t.string :password_digest
      t.integer :zipcode
      t.boolean :online, default: false
    end
  end
end
