class AccountController < ApplicationController

	before_filter :confirm_logged_in, :except => [:signin,:signup, :attempt_signin, :signout]

	def index
		#force all traffic to sign in at the index level
		signin
		render('signin')
	end

	def attempt_signin
		authorized_user = AuthUser.authenticate(params[:email],params[:password])
		if authorized_user
			session[:user_id] = authorized_user.id
			session[:email] = authorized_user.email
			flash[:notice] = "You are now logged in."
			redirect_to(:controller => 'dashboard', :action => 'index')
		else
			flash[:notice] = "Invalid login."
			redirect_to(:action => 'signin')			
		end
	end
	
	def signin
		@page_title = "Sign In"
	end

	def signup
		@page_title = "Sign Up"
	end

	def signout
		session[:user_id] = nil
		session[:email] = nil		
		flash[:notice] = "You have been logged out"
		redirect_to(:action => 'signin')
	end

	def usr
	end

end
