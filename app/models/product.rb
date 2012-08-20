class Product < ActiveRecord::Base
  attr_accessible :description, :name, :packaging, :price,
  								:product_attribute, :qty_avail, :uom,
  								:user_id
  
  belongs_to :user
  has_many :orders, :through => :order_items
  
end
