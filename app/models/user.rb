class User < ActiveRecord::Base
  attr_accessible :about, :address, :business, :business_name,
  								:city, :email, :favorite, :first_name,
  								:last_name, :password, :password_confirmation,
  								:password_digest, :phone, :state, :tag,
  								:website, :zip
  
  has_secure_password

  has_many :products
  has_many :orders
  
  # ???
  validates_associated :products
  validates_uniqueness_of :email
  
end
