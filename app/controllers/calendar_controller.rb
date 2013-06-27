class CalendarController < ApplicationController
	
	layout 'application'
	def index
	end

	def usr
		@this_user = AuthUser.where('user_id = ?', params[:id])
		@event = ItemData.where('user_id = ? AND item_viewable = true', params[:id])
		@contact = Contact.where('SELECT COUNT(*) FROM item_data WHERE id = contact.event_id AND item_data.is_viewable = true')
		@location = Location.where('SELECT COUNT(*) FROM item_data WHERE item_data.location_id = location.id AND item_data.is_viewable = true')
	end
end
