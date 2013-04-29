class ContactsController < ApplicationController

	def list
		@contact = Contact.all
		@contact = Contact.order
	end

	def show

	end	

end
