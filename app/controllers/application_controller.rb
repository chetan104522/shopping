class ApplicationController < ActionController::Base

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def log_in user
		session[:user_id] = user.id
	end

	helper_method :current_user

	def authorize
		unless current_user
			flash[:alert] = "Please log in."
			redirect_to login_path 
		end
	end

	def log_out
		session[:user_id] = nil
	end

end