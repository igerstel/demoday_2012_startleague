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
end
