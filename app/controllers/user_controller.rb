require 'digest/sha1'
class UserController < ApplicationController

	layout 'admin'
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

	def verify

	end

	def register
		#if params[:temp_key] is in user table, delete user from user table and add them to authuser table
	end

end