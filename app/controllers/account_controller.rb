class AccountController < ApplicationController
	
	before_filter :confirm_logged_in, :except => [:signin, :attempt_signin, :signout]

	def index
	end

	def attempt_signin
		authorized_user = AuthUser.authenticate(params[:displayname],params[:password])
		if authorized_user
			session[:user_id] = authorized_user.id
			session[:displayname] = authorized_user.displayname
			flash[:notice] = "You are now logged in."
			redirect_to(:action => 'menu')
		else
			flash[:notice] = "Invalid displayname/password combination."
			redirect_to(:action => 'signin')			
		end
	end
	
	def signin
	end

	def signup
	end

	def signout
		session[:user_id] = nil
		session[:displayname] = nil		
		flash[:notice] = "You have been loggen out"
		redirect_to(:action => 'signin')
	end
end
