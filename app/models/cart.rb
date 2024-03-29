class Cart < ActiveRecord::Base
  #attr_accessible :purchased_at

  has_many :order_items, dependent: :destroy
  has_one :order

  def total_price
  	order_items.to_a.sum(&:full_price)
  end
end
