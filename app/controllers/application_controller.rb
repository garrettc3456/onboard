class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


# the application controller manages EVERY controller of the website

# I want there to be a shortcut for finding the current user
# across the whole site
# we decide the name, in this case "current_user"
	def current_user
		if session[:user_id].present?
			User.find(session[:user_id])
		end
	end

# to make the current user method above useful in the views
# add a help method
helper_method :current_user

# add a shortcut to redirect to the sign up page if logged out

	def make_sure_logged_in
		if not current_user.present?
			flash[:error] = "You must be signed up to see this page"
			redirect_to new_user_path
		end
	end
end
