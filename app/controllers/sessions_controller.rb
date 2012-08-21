class SessionsController < ApplicationController
	def new
	end

	def create
    user = User.find_by_email(params[:email])
    if user
      if user.authenticate(params[:password])
        session["user_id"] = user.id
        redirect_to user_url(user), notice: "Welcome back, #{user.first_name}."
      else
        redirect_to root_url, notice: "Unknown email or password."
      end
    else
      redirect_to root_url, notice: "Unknown email or password."
    end
  end

  def newlogin
    user = User.find_by_email(params[:email])
    if user
      if user.authenticate(params[:password])
        session["user_id"] = user.id
        redirect_to user_new2_url(params[:id])
      else
        redirect_to root_url, notice: "Unknown email or password."
      end
    else
      redirect_to root_url, notice: "Unknown email or password."
    end
  end

	def destroy
		reset_session
		redirect_to root_url
	end
end