class Product < ActiveRecord::Base
  attr_accessible :description, :name, :packaging, :price,
  								:product_attribute, :qty_avail, :uom,
  								:user_id
  
  belongs_to :user
  has_many :orders, :through => :order_items
  
  #validates :user_id, :numericality  => { :only_integer => true,
  # 	 							 	 :greater_than_or_equal_to => 0 }
  #validates :qty_avail, :numericality => { :only_integer => true,
  #									   :greater_than_or_equal_to => 0 }
  #validates :uom, :inclusion => { :in => %w(ea bushel lb),
  #  	:message => "%{value} is not a valid group" }
  #validates :packaging, :inclusion => { :in => %w(ea bushel lb),
  #  	:message => "%{value} is not a valid group" }
  #validates :product_attribute, :inclusion => { :in => %w(fruits vegetables livestock pumpkins),
  #  	:message => "%{value} is not a valid category" }
  #validates :cost, :numericality => { :greater_than => 0 }
  #validates :name, :length => { :minimum => 3 }

end
