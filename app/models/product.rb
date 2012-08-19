class Product < ActiveRecord::Base
  attr_accessible :description, :name, :packaging, :price, :product_attribute, :qty_avail, :uom, :user_id
  
  belongs_to :users
  has_many :orders, :through => :order_items
  
end
