class ItemsController < ApplicationController

	layout 'admin'
	before_filter :confirm_logged_in, :except => [:search]
	respond_to :html, :json, :xml

	def index
		list
		render('list')
	end	

	def list
		@event = ItemData.where('user_id = ?',session[:user_id])			
	end

	def show
		@event = ItemData.find(params[:id])
		@timedate = ItemTimeDate.where('(SELECT COUNT(*) FROM item_data 
											WHERE item_data.timedate_id = item_time_dates.id)')
		@locals = Location.where('(SELECT COUNT(*) FROM item_data 
											WHERE item_data.location_id = locations.id
											AND item_data.user_id = ?)', session[:user_id])			
	end

	def new		
		@event = ItemData.new
		
		@event_types = Item.all
		@event_types = Item.order

		@event_contact = Contact.where('user_id = ?', session[:user_id])

		@dayweek_options = ""
		(1..7).each_with_index do |i,index|
			@dayweek_options = @dayweek_options + "<option value='#{i}'>#{i}</option>"
		end	
		@daymonth_options = ""
		(1..30).each_with_index do |i,index|
			@daymonth_options = @daymonth_options + "<option value='#{i}'>#{i}</option>"
		end
		@weekmonth_options = ""
		(1..5).each_with_index do |i,index|
			@weekmonth_options = @weekmonth_options + "<option value='#{i}'>#{i}</option>"
		end
	end	

	def create
		#If param not set will default
		#params[:contacts_array]

		@contact = Contact.new
		@contact.contact_title = params[:contact_title]
		@contact.contact_first_name = params[:contact_first_name]
		@contact.contact_last_name = params[:contact_last_name]
		@contact.contact_email = params[:contact_email]
		@contact.contact_phone = params[:contact_phone]
		@contact.contact_organization = params[:contact_organization]
		@contact.save 

		@parking = Parking.new()
		@parking.parking_details = params[:parking_details]
		@parking.save

		@timedate = ItemTimeDate.new()
		@timedate.start_time = params[:start_time] 
		@timedate.end_time = params[:end_time]
		@timedate.start_date = params[:start_date]
		@timedate.end_date = params[:end_date]
		@timedate.recurring_flag = params[:recurring_flag]
		@timedate.day_of_week = params[:day_of_week]
		@timedate.day_of_month = params[:day_of_month]		
		@timedate.week_of_month = params[:week_of_month]
		@timedate.save		

		@event = ItemData.create(params[:item_data])
		@event.user_id = session[:user_id]
		@event.item_id = params[:item]
		@event.parking_id = @parking.id

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
		@event_types = Item.all
		@event_types = Item.order
		@event_location = Location.where('(SELECT COUNT(*) FROM item_data 
											WHERE item_data.location_id = locations.id
											AND item_data.user_id = ?)', session[:user_id])
		@contact = Contact.where('(SELECT COUNT(*) FROM item_data 
											WHERE item_data.id = contacts.event_id
											AND item_data.user_id = ?)', session[:user_id])										
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
		@event = ItemData.where('user_id = ?',session[:user_id])		
		respond_with @event			
	end	

	def specific
		@event = ItemData.where('id = ? AND user_id = ?',params[:id],session[:user_id])	
		respond_with @event			
	end		

	def build
		@event = ItemData.new(params[:event])
		@event = ItemData.user_id(session[:user_id])
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

	#AJAX
	def ajax_create
		@event.ItemData.new
		@event.item_description = params[:item_description]
		@event.item_special_note = params[:item_special_note]
		@event.item_title = params[:item_title]
		@event.item_viewable = params[:item_viewable]
		@event.item_publish_date = Time.now
		@event.item_status = params[:item_status]
		
		if params[:new_location] == true
			#@event_location = Location.new()
			#@event_location.location_address_1 = params[:location_address_1]
			#@event_location.location_address_2 = params[:location_address_2]
			#@event_location.location_city = params[:location_city]
			#@event_location.location_state = params[:location_state]
			#@event_location.location_country = params[:location_country]			
		else
			#@event.location_id = params[:location]
		end

		if @event.save
			render(:html => 'Hello World')
		else 	
			render(:html => 'Problem exists')			
		end

	end		
	
end