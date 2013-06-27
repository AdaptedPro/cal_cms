class CalendarController < ApplicationController
	
	layout 'application'
	def index
	end

	def usr
		@event = ItemData.where('id = ? AND item_viewable = true', params[:id])
	end
end
