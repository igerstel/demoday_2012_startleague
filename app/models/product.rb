class Product < ActiveRecord::Base
  attr_accessible :description, :name, :packaging, :price,
  								:product_attribute, :qty_avail, :uom,
  								:user_id, :image
  
  belongs_to :user
  has_many :order_items
  # has_many :orders, :through => :order_items
  
  before_destroy :ensure_not_referenced_by_any_order_item

  mount_uploader :image, PhotoUploader  

  private
  
  def ensure_not_referenced_by_any_order_item 
    if order_items.empty?
      return true
      else
        errors.add(:base, 'Order Items present')
        return false 
        end
    end
  

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

  # def getdates
  #   if params[:start_date].present? && params[:end_date].present?
  #     @start_date = params[:start_date]
  #     @end_date = params[:end_date]
  #   else
  #     @start_date = (Date.today-7).to_s
  #     @end_date = (Date.today).to_s
  #   end
  #   return(@start_date, @end_date)
  # end

end
