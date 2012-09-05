class Location < ActiveRecord::Base
  attr_accessible :city, :day, :state, :street_address, :zip,
                  :latitude, :longitude, :user_id

  geocoded_by :fulladdress
  
  def fulladdress
    latlon = "#{self.street_address}, #{self.city}, #{self.state}, #{self.zip}"
    return latlon
  end

  after_validation :geocode#, :if => :address_changed?
  

acts_as_gmappable

def gmaps4rails_address
#describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
  "#{self.street_address}, #{self.city}, #{self.zip}" 
end

  #   @markers 
  # @markers = Location.all.to_gmaps4rails
  # 


 # def gmaps4rails_infowindow
 #   "<img src=\"#{self.picture}\"> #{self.name}"
 # end

  belongs_to :user

end
