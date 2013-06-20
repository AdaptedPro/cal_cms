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
			redirect_to(:controller => 'user', :action => 'verify')				
		else			
			# Instantiate a new object using form parameters
			@user = User.new(:first_name => params[:first_name_field], 
							:last_name => params[:last_name_field], 
							:email => params[:email_field], 
							:hashed_password => Digest::SHA1.hexdigest(params[:password]))

			if @user.save
				flash[:notice] = "User created."
				#redirect_to(:action => 'list')
			else
				#render('new')
				flash[:notice] = "User not created."
			end				
		end		
		render('verify')
	end	

	def verify

	end

	def register
		#if params[:temp_key] is in user table, delete user from user table and add them to authuser table
	end

end
