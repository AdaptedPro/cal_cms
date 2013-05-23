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

end
