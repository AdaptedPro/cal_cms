class SubjectsController < ApplicationController
	
	layout 'admin'
	before_filter :confirm_logged_in
	
	def index
		list
		render('list')
	end	

	def list
		@subject = Subject.all
		@subject = Subject.order		
	end

	def show
		@subject = Subject.find(params[:id])
	end

	def new
		@subject = Subject.new #(:subject_name => "Default")
	end	

	def create
		# Instantiate a new object using form parameters
		@subject = Subject.new(params[:subject])
		# Save the object
		if @subject.save
			# if save succeeds, redirect to the list action
			flash[:notice] = "Subject created."
			redirect_to(:action => 'list')
		else
			# If save fails, redisplay the form so the iser can fix problems
			render('new')
		end	
	end	

	def edit
		@subject = Subject.find(params[:id])
	end

	def update
		# Find object using form parameters
		@subject = Subject.find(params[:id])
		# Update the object
		if @subject.update_attributes(params[:subject])
			flash[:notice] = "Subject updated."			
			# if update succeeds, redirect to the list action
			redirect_to(:action => 'show', :id => @subject.id)
		else
			# If save fails, redisplay the form so the iser can fix problems
			render('edit')
		end	
	end	

	def delete
		@subject = Subject.find(params[:id])
	end	

	def destroy
		Subject.find(params[:id]).destroy
			flash[:notice] = "Subject destroyed."		
		redirect_to(:action => 'list')
	end		

end
