class AddGeoToLocation < ActiveRecord::Migration
  def change
  	add_column :locations, :latitude,  :float #you can change the name, see wiki
		add_column :locations, :longitude, :float #you can change the name, see wiki
		add_column :locations, :gmaps, :boolean #not mandatory, see wiki
  end
end
