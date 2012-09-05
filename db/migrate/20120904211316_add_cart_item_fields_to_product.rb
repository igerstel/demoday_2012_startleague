class AddCartItemFieldsToProduct < ActiveRecord::Migration
  def change
  	add_column :products, :shopping_cart_item_fields, :string
  end
end
