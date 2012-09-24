class Order < ActiveRecord::Base
  attr_accessible :comments, :total_price, :total_qty,
  								:user_id
  
  has_many :products, :through => :order_items
  has_many :order_items, :dependent => :destroy
  belongs_to :user
  belongs_to :cart
  
end
