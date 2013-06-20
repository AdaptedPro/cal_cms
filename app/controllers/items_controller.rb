class ItemsController < ApplicationController

	layout 'admin'
	before_filter :confirm_logged_in, :except => [:search]
	respond_to :html, :json, :xml

	def index
		list
		render('list')
	end	

	def list
		@event = ItemData.all
		@event = ItemData.order	
	end

	def show
		@event = ItemData.find(params[:id])
		@timedate = ItemTimeDate.where('(SELECT COUNT(*) FROM item_data 
											WHERE item_data.timedate_id = item_time_dates.id)')
		@locals = Location.where('(SELECT COUNT(*) FROM item_data 
											WHERE item_data.location_id = locations.id)')		
	end

	def new
		@event = ItemData.new
	end	

	def create
		# Instantiate a new object using form parameters
		@event = ItemData.new(params[:event])
		# Save the object
		if @event.save
			# if save succeeds, redirect to the list action
			flash[:notice] = "Event created."
			redirect_to(:action => 'list')
		else
			# If save fails, redisplay the form so the iser can fix problems
			render('new')
		end	
	end	

	def edit
		@event = ItemData.find(params[:id])
	end

	def update
		# Find object using form parameters
		@event = ItemData.find(params[:id])
		# Update the object
		if @ItemData.update_attributes(params[:event])
			flash[:notice] = "event updated."			
			# if update succeeds, redirect to the list action
			redirect_to(:action => 'show', :id => @ItemData.id)
		else
			# If save fails, redisplay the form so the iser can fix problems
			render('edit')
		end	
	end	

	def delete
		@event = ItemData.find(params[:id])
	end	

	def destroy
		ItemData.find(params[:id]).destroy
			flash[:notice] = "event destroyed."		
		redirect_to(:action => 'list')
	end	

	#REST
	def all
		@event = ItemData.all
		@event = ItemData.order			
		respond_with @event			
	end	

	def specific
		@event = ItemData.all
		@event = ItemData.order			
		respond_with @event			
	end		

	def build
		@event = ItemData.new(params[:event])
		@event.save
		respond_with @event
	end

	def tweek
		@event = ItemData.find(params[:id])
		@event.update_attributes(params[:event])
		respond_with @event
	end		

	def break
		@event = ItemData.find(params[:id])
		@event.destroy
		respond_with @event		
	end
	
end