class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :qty_ordered
      t.decimal :qty_ordered_price

      t.timestamps
    end
  end
end
