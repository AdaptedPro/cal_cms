class AccountController < ApplicationController
	
	layout 'login'	
	before_filter :confirm_logged_in, :except => [:signin,:signup, :attempt_signin, :signout]

	def index

	end

	def attempt_signin
		authorized_user = AuthUser.authenticate(params[:email],params[:password])
		if authorized_user
			session[:user_id] = authorized_user.id
			session[:email] = authorized_user.email
			flash[:notice] = "You are now logged in."
			redirect_to(:action => 'dashboard')
		else
			flash[:notice] = "Invalid login."
			redirect_to(:action => 'signin')			
		end
	end
	
	layout 'login'
	def signin
		@page_title = "Sign In 2"
	end

	def signup
	end

	def signout
		session[:user_id] = nil
		session[:email] = nil		
		flash[:notice] = "You have been loggen out"
		redirect_to(:action => 'signin')
	end

	def dashboard 
		@usr_events = ItemData.where('user_id = ?', session[:user_id])
		@usr_events_count = @usr_events.count
		
		@user_locations = ItemData.where('(SELECT COUNT(*) FROM locations 
											WHERE locations.id = item_data.location_id)')

		@locals = Location.where('(SELECT COUNT(*) FROM item_data 
											WHERE item_data.location_id = locations.id)')

		@location_count = @user_locations.count()
		
		@user_contacts = ItemData.where('(SELECT COUNT(*) FROM contacts 
											WHERE contacts.id = item_data.location_id)')
		@contacts_count = @user_contacts.count()	
	end

	def usr
	end

end
