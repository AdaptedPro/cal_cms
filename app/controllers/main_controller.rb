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
	end

	def about
		render('about')
	end	

	def business
		render('business')
	end		

	def developers
		render('developers')
	end	

	def help
		render('help')
	end	

	def privacy
		render('privacy')
	end		

	def terms
		render('terms')
	end	

	def facebook
		if params[:verified] == true #|| params[:link].start_with?('https://www.facebook.com/')
			session[:user_id] = params[:id]
			session[:email] = params[:email]
			session[:fb] = true
			flash[:notice] = "You are now logged in via facebook."
			#redirect_to(:controller => 'dashboard', :action => 'index')
			render :json => { :reply => 'good' }
		else
			flash[:notice] = "Invalid login."
			#redirect_to(:action => 'signin')	
			render :json => { :reply => 'bad' }		
		end
	end

end
