class ContactsController < ApplicationController

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(params[:contact])
		if @contact.save
			ContactsMailer.general_mesage(@contact).deliver
			ContactsMailer.thanks_message(@contact).deliver
		else
			render 'new'
		end
	end

end
