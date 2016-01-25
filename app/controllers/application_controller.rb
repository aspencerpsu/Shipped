class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception
  	helper_method :current_user
  	helper_method :check_back_location

  	def current_user
  		if session[:user_id]
  			@current_user = User.find(session[:user_id]) 
  		end
 	end

	def check_back_location(job, location)


		if  @boat.location == location
			flash[:notice] = "Cannot ship this boat to this location"
			print '#(@jobfind}'
			return false
		else 
			@job.boat.update(location: location)
			flash[:notice] = "Successfully moved this boat to the correct location"
			return true
		end
	end
end
