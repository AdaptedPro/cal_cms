class ContactsController < ApplicationController
	before_filter :confirm_logged_in

	def index
		list
		render('list')
	end

	layout 'admin'
	def list
		@contact = Contact.all
		@contact = Contact.order
	end

	def show

	end	

end
