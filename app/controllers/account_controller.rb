require 'digest/sha1'
class AccountController < ApplicationController

	before_filter :confirm_logged_in, :except => [:signin,:signup, :attempt_signin, :attempt_signup, :verify, :signout]

	def index
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

	def attempt_signup
		authorized_user = AuthUser.authenticate(params[:email],params[:password])
		if authorized_user
			flash[:notice] = "It appears as if you already have an account. Please login."
			redirect_to(:action => 'signup')
		else
			# Instantiate a new object using form parameters
			@user = User.new()
			@user.first_name = params[:first_name]
			@user.last_name = params[:last_name]
			@user.hashed_password = Digest::SHA1.hexdigest(params[:password])
			@user.email = params[:email]
			@user.salt = params[:email]
			@user.status = params[:commit]

			if @user.save
				#session[:email] = params[:email]
		        #UserMailer.confirm_email(@user).deliver		 
				#flash[:notice] = "User created."
				#redirect_to(:action => 'verify')
			else
				#flash[:notice] = "Not just yet! Perhaps try a different email address."
				#redirect_to(:action => 'signup')
			end
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

	def confirm
 		@auth_user = AuthUser.find(params[:id])

 		@hash_email = params[:e]
 		@user = User.select('*').into('auth_user').where('Digest::SHA1.hexdigest(email) = ?', @hash_email)

 		if !@user.blank?
			session[:email] = params[:email]
	        UserMailer.welcome_email(@user).deliver		 
			flash[:notice] = "User created."
			redirect_to(:action => 'verify')
		else
			flash[:notice] = "Not just yet! Perhaps try a different email address."
			redirect_to(:action => 'signup')
		end

	end

	def verify
	end

end