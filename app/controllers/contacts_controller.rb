class ContactsController < ApplicationController
	before_filter :confirm_logged_in
	def list
		@contact = Contact.all
		@contact = Contact.order
	end

	def show

	end	

end
