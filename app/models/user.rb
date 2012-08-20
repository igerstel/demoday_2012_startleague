class User < ActiveRecord::Base
  attr_accessible :about, :address, :business, :business_name,
  								:city, :email, :favorite, :name, :password,
  								:password_confirmation, :password_digest,
  								:phone, :state, :tag, :website, :zip
  
  has_secure_password

  has_many :products
  has_many :orders
  
  # ???
  validates_associated :products
  
end
