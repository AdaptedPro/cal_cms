class MainController < ApplicationController
	layout 'application'
	def index
		welcome
		render('welcome')
	end

	def welcome
		@locations = Location.all;
		@locations = Location.order;		
	end
end
