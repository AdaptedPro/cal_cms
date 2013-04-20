class EventsController < ApplicationController
  def index
  	render('index')
  end

  def details
  	render(:text => 'Event Details here')
  end

  def no_access
  	render(:text => 'This is for events the user has no access to')
  end
end
