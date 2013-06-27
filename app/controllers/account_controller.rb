require 'digest/sha1'
class AccountController < ApplicationController

	before_filter :confirm_logged_in, :except => [:signin,:signup,:channel,:attempt_signin,:attempt_signup,:verify,:signout,:confirm,:recover,:attempt_recover]

	def index
		signin
		render('signin')
	end

	def channel
		cache_expire = 1.year
		response.headers["Pragma"] = "public"
		response.headers["Cache-Control"] = "max-age=#{cache_expire.to_i}"
		response.headers["Expires"] = (Time.now + cache_expire).strftime("%d %m %Y %H:%I:%S %Z")
		render :layout => false, :inline => "<script src='//connect.facebook.net/en_US/all.js'></script>"
	end

	def attempt_signin
		authorized_user = AuthUser.authenticate(params[:email],params[:password])
		if authorized_user
			session[:user_id] = authorized_user.id
			session[:email] = authorized_user.email
			flash[:notice] = "You are now logged in."
			redirect_to(:controller => 'dashboard', :action => 'index')
		else
			flash[:notice] = "Invalid login, please try again."
			redirect_to(:action => 'signin')			
		end
	end

	def attempt_signup
		@new_auth_user = AuthUser.where('email = ?', params[:email])
		@new_user = User.where('email = ?', params[:email])
		
		if !@new_auth_user.blank? || !@new_user.blank?
			flash[:notice] = "Not just yet! Perhaps try a different email address."
			redirect_to(:action => 'signup')
		else			
			# Instantiate a new object using form parameters
			@user = User.new()
			@user.password = params[:password]
			@user.first_name = params[:first_name]
			@user.last_name = params[:last_name]
			@user.hashed_password = User.hash_with_salt(params[:password], User.make_salt(params[:email]))
			@user.email = params[:email]
			@user.salt = User.make_salt(params[:email])
			@user.status = params[:commit]

			if @user.save
		        UserMailer.confirm_email(@user).deliver		 
				redirect_to(:action => 'verify')
			else
				flash[:notice] = "Could not create account. #{params[:email]}"
				redirect_to(:action => 'signup')
			end
		end
	end	
	
	def signin
		if !session[:user_id].blank?
			redirect_to(:controller => 'dashboard', :action => 'index')
		else
			@page_title = "Sign In"			
		end
	end

	def signup
		if !session[:user_id].blank?
			redirect_to(:controller => 'dashboard', :action => 'index')
		else
			@page_title = "Sign Up"			
		end
	end

	def signout
		session[:user_id] = nil
		session[:email] = nil
		session[:fb] = nil		
		flash[:notice] = "You have been logged out"
		redirect_to(:action => 'signin')
	end

	def confirm
 		@email = params[:e]
 		@user = User.where('email = ?', @email)
 		if !@user.blank?
			begin
				User.make_auth_from_user(@email) 
				session[:email] = params[:e] 
				flash[:notice] = "Account was created. <strong><a href='signin'>Click here to sign in.</a></strong>".html_safe  
			rescue
				flash[:notice] = "There was a problem authorizing your account."
			ensure 
				redirect_to(:action => 'verify')  
			end
		else
			flash[:notice] = "Could not confirm your email address. Please check your url."
			redirect_to(:action => 'signup')
		end
	end

	def usr
		@auth_user = AuthUser.find_by_id(session[:user_id])
	end

	def update
		# Find object using form parameters
		@auth_user = AuthUser.find(params[:id])
		# Update the object
		if @auth_user.update_attributes(params[:auth_user])
			flash[:notice] = "Your info has been updated."			
			# if update succeeds, redirect to the list action
			redirect_to(:action => 'usr')
		else
			render('usr')
		end			
	end

	def recover
	end

	def attempt_recover
		@auth_user = AuthUser.where('email = ?', params[:email])
		@user = User.where('email = ?', params[:email])

		if !@auth_user.blank?
			@hash = Digest::SHA1.hexdigest(Time.now.seconds_until_end_of_day)
			@recovery = Recovery.new
			@recovery.email = @auth_user.email
			@recovery.recovery_hash = @hash

			if @recovery.save 			
	        	UserMailer.recover_email(@auth_user, @hash).deliver		 
				redirect_to(:action => 'verify')
			else	
				flash[:notice] = "Could not reset your password at this time."
				redirect_to(:action => 'signup')				
			end
		else
			if !@user.blank?
		        UserMailer.confirm_email(@user).deliver		 
				redirect_to(:action => 'verify')				
			else
				flash[:notice] = "That email address is not in our records."
				redirect_to(:action => 'signup')	
			end		
		end
		#UserMailer.confirm_email(@user).deliver			
	end	

	def reset
		@hash = params[:h]
		@email = params[:e] 
		@recovery = Recovery.where('recovery_hash = ? AND email = ?', @hash, @email)			
	end	

	def password_reset
	end

	def verify
	end	

end
