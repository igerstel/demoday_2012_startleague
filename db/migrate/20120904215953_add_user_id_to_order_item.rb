class AddUserIdToOrderItem < ActiveRecord::Migration
  def change
  	add_column :order_items, :shopping_cart_item_fields, :string
  end
end
