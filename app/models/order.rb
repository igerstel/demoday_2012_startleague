class Order < ActiveRecord::Base
  attr_accessible :comments, :total_price, :total_qty,
  								:user_id
  
  has_many :products, :through => :order_items
  has_many :order_items, :dependent => :destroy
  belongs_to :user
  
  def add_product(product_id)
  current_item = order_items.where(:product_id => product_id).first 
      if current_item
      # current_item.qty_ordered += 1
  else
      current_item = order_items.build(:product_id => product_id)
  end
    current_item
  end
  
    
  
end
