class OrderItem < ActiveRecord::Base
  attr_accessible :order_id, :product_id, :qty_ordered,
  								:qty_ordered_price
  
  belongs_to :order
  belongs_to :product

end
