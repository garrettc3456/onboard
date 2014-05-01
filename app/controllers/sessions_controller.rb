class SessionsController < ApplicationController


	def new
		# sign up form
		# no need for any variable because we're not adding anything
		# to the database

	end

	def create
		# INSTRUCTIONS
		# lets get the username and password from the form
		# lets see if there is a user with that username
		# if there is AND the password matches, then login
		# if NOT, dont log in and show an error

		@username = params[:session][:username]
		# within the session form, get the username^
		@password = params[:session][:password]

		@user = User.find_by_username(@username)

		if @user.present? and @user.authenticate(@password)
			# to log in give them a session
			session[:user_id] = @user.id
			flash[:success] = "Welcome back, #{@user.name}"
			redirect_to root_path
		else
			flash[:error] = "Log in failed"
			render "new"
		end

	end



	def destroy
		# log out
		reset_session
		flash[:success] = "You are now logged out"
		redirect_to root_path
	end



end
