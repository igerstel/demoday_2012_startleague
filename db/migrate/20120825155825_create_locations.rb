class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :day

      t.timestamps
    end
  end
end
