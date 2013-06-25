class DashboardController < ApplicationController

	layout 'admin'
	before_filter :confirm_logged_in

	def index
		if !session[:fb_user_id].blank?

		else	
			@usr = AuthUser.find_by_id(session[:user_id])

			@usr_events = ItemData.where('user_id = ?', session[:user_id])
			@usr_events_count = @usr_events.count
			
			@user_locations = ItemData.where('(SELECT COUNT(*) FROM locations 
												WHERE locations.id = item_data.location_id
												AND item_data.user_id = #{session[:user_id]})')

			@locals = Location.where('(SELECT COUNT(*) FROM item_data 
												WHERE item_data.location_id = locations.id
												AND item_data.user_id = #{session[:user_id]})')

			@location_count = @user_locations.count()
			
			#@user_contacts = ItemData.where('(SELECT COUNT(*) FROM contacts 
			#									WHERE contacts.id = item_data.location_id)')
			#@contacts_count = @user_contacts.count()
		end		
 	end

end