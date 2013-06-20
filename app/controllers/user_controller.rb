class UserController < ApplicationController

	def index
		dashboard
		render('dashboard')		
	end

	def dashboard
		#Check login
		#username =>
		#pending_proposed_events
		#event_rsvps 
	end

	def history
		#saved_events
	end

	def lists
		#categories =>
	end

	def settings
	end

	def attempt_signup
		existing_user = AuthUser.where('email = ?', params[:email])	
		if !existing_user.blank?
			flash[:notice] = "An account with that email has already been created."
			#redirect_to(:action => 'signup')
			redirect_to(:controller => 'user', :action => 'verify')				
		else
			flash[:notice] = "Good."
			#new_user = User.new
			#if new user is created then send to verify
			redirect_to(:controller => 'user', :action => 'verify')				
		end
	end	

	def verify

	end

	def register
		#if params[:temp_key] is in user table, delete user from user table and add them to authuser table
	end

end
