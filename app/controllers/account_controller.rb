class AccountController < ApplicationController

	before_filter :confirm_logged_in, :except => [:signin,:signup, :attempt_signin, :signout]

	def index

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

	def attempt_signup
		
		#@temp_user = TempUser.new(params[:subject])

		#if @temp_user.save
		#	flash[:notice] = "New User created."
		#	redirect_to(:action => 'verify')
		#else
		#	flash[:notice] = "You could not be added. Please try again."
		#	redirect_to(:action => 'signup')
		#end			
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
		flash[:notice] = "You have been loggen out"
		redirect_to(:action => 'signin')
	end

	def usr
	end

end
