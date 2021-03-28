class CreateTrucks < ActiveRecord::Migration[6.1]
  def change
    create_table :trucks do |t|
      t.string :name
      t.string :zpassword_digest
      t.integer :zipcode
      t.boolean :online
    end
  end
end
