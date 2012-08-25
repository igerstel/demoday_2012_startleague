class Location < ActiveRecord::Base
  attr_accessible :city, :day, :state, :street_address, :zip
  
  belongs_to :user
end
