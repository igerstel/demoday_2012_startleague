class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :product_attribute
      t.text :description
      t.string :packaging
      t.string :uom
      t.decimal :price
      t.integer :qty_avail
      t.integer :user_id

      t.timestamps
    end
  end
end
