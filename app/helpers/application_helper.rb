module ApplicationHelper

  def logged_in?
    session["user_id"].present?
  end
  
  def current_user
    User.find_by_id(session["user_id"])
  end

  def userhome
		stringout = ""
		if User.find_by_id(session["user_id"]).business == "Farm"
			link_to 'Skip this and go to Farmer Homepage', farmer_list_url
		else
			link_to 'Skip this and go to Chef Homepage', chef_list_url
		end
	end

	def getcoords(zip)
		url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{zip}&sensor=false"
		response = open(url).read
		json_response = JSON.parse(response)
		lat = json_response["results"].first["geometry"]["location"]["lat"]
		lng = json_response["results"].first["geometry"]["location"]["lng"]
		return [lat,lng]
	end




end
