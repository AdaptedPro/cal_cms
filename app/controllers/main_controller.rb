class MainController < ApplicationController
	layout 'application'
	def index
		welcome
		render('welcome')
	end

	def welcome
		@event = ItemData.all
		@event = ItemData.order	

		
		@locations = Location.all;
		@locations = Location.order;

		@msg = "Hello World"		
	end
end
