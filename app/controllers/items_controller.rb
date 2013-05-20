class ItemsController < ApplicationController

	layout 'admin'
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
	end

	def new
		@event = ItemData.new #(:event_name => "Default")
	end	

	def create
		# Instantiate a new object using form parameters
		@event = ItemData.new(params[:event])
		# Save the object
		if @ItemData.save
			# if save succeeds, redirect to the list action
			flash[:notice] = "event created."
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
	
end
