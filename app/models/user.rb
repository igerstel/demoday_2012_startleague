class User < ActiveRecord::Base
  attr_accessible :about, :address, :business, :business_name,
  								:city, :email, :favorite, :first_name,
  								:last_name, :password, :password_confirmation,
  								:password_digest, :phone, :state, :tag,
  								:website, :zip
  
  has_secure_password

  has_many :products
  has_many :orders
  has_many :locations

  mount_uploader :photo, PhotoUploader  

  #validates_associated :products
  #validates_associated :orders
  #validates_uniqueness_of :email => { :case_sensitive => :false,
  #                        :minimum => 6 }


  
end
