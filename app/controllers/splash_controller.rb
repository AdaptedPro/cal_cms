class SplashController < ApplicationController
	
	layout 'app'
	def index
		@subject = Subject.all
		@subject = Subject.order

		@event_item = ItemData.all
		@event_item = ItemData.order
	end	

	def show
		@event_item = ItemData.find(params[:id])
	
		#@location_object = Location.find(params[:id])
		#@location_object = Location.new(params[:subject])
		# Save the object
		#if @subject.save
			# if save succeeds, redirect to the list action
			#flash[:notice] = "Subject created."
			#redirect_to(:action => 'index')
		#else
			# If save fails, redisplay the form so the iser can fix problems
			#render('new')
		#end

	end	

	def login
		#@event = Event.all;
		#@event = Event.order;
	end	
end
