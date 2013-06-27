class ContactsController < ApplicationController
	layout 'admin'
	before_filter :confirm_logged_in, :except => [:search]
	respond_to :html, :json, :xml

	def index
		list
		render('list')
	end

	def list
		@contact = Contact.where('user_id = ?', session[:user_id])
	end

	def show
		@contact = Contact.find(params[:id])	
		@event = ItemData.where('SELECT COUNT(*) FROM contacts 
									WHERE contacts.event_id = item_data.id AND contacts.id = ?', params[:id])
	end

	def new
		@contact = Contact.new		
	end

	def create
		@contact = Contact.new(params[:contact])
		@contact.user_id = session[:user_id]		

		if @contact.save
			# if save succeeds, redirect to the list action
			flash[:notice] = "Contact created."
			redirect_to(:action => 'list')
		else
			# If save fails, redisplay the form so the iser can fix problems
			render('new')
		end			
	end

	def edit
		@contact = Contact.find(params[:id])		
	end

	def update
		# Find object using form parameters
		@contact = Contact.find(params[:id])
		# Update the object
		if @contact.update_attributes(params[:contact])
			flash[:notice] = "Contact updated."			
			# if update succeeds, redirect to the list action
			redirect_to(:action => 'show', :id => @contact.id)
		else
			# If save fails, redisplay the form so the iser can fix problems
			render('edit')
		end	
	end		

end
