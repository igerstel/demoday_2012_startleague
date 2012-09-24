class OrderItem < ActiveRecord::Base
  attr_accessible :product_id, :qty_ordered, :cart_id#, :order_id, 
  								#:qty_ordered_price
  
  #belongs_to :order
  belongs_to :product
  belongs_to :cart

  def full_price
   	qty_ordered_price * qty_ordered
  end
end
