class EventsController < ApplicationController
	
	before_filter :confirm_logged_in, :except => [:signin, :attempt_signin, :signout]

  def index

  	#render('index')
  end

	layout 'admin'
	def usr
		#@item_type = ItemData.where('(SELECT * FROM items WHERE items.id = ?)', 1)	
		@event = ItemData.where('user_id = ?', session[:user_id])	
	end

  def details
  	render(:text => 'Event Details here')
  end

  def no_access
  	render(:text => 'This is for events the user has no access to')
  end
end
