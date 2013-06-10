class LocationsController < ApplicationController
	
	before_filter :confirm_logged_in

	def index
		list
		render('list')		
	end

	layout 'admin'
	def list
		@locations = Location.where(
			'(SELECT COUNT(*) FROM item_data 
				WHERE item_data.location_id = locations.id)')
	end

	def usr
	end

	def show
		@location = Location.find(params[:id])
	end

	def new
		@location = Location.new 
		@locals = Location.where('(SELECT COUNT(*) FROM item_data 
											WHERE item_data.location_id = locations.id)')		
	end	

	def create
		# Instantiate a new object using form parameters
		@location = Location.new(params[:location])
		# Save the object
		if @location.save
			# if save succeeds, redirect to the list action
			flash[:notice] = "Location created."
			redirect_to(:action => 'list')
		else
			# If save fails, redisplay the form so the iser can fix problems
			render('new')
		end	
	end	

	def edit
		@location = Location.find(params[:id])
	end

	def update
		# Find object using form parameters
		@location = Location.find(params[:id])
		# Update the object
		if @location.update_attributes(params[:location])
			flash[:notice] = "Location updated."			
			# if update succeeds, redirect to the list action
			redirect_to(:action => 'show', :id => @location.id)
		else
			# If save fails, redisplay the form so the iser can fix problems
			render('edit')
		end	
	end	

	def delete
		@location = Location.find(params[:id])
	end	

	def destroy
		Location.find(params[:id]).destroy
			flash[:notice] = "Location destroyed."		
		redirect_to(:action => 'list')
	end		

end