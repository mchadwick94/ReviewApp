class ContactsController < ApplicationController

	def new
		@contact = Contact.new
	end

	def create
			
			@contact = Contact.last
			cname = params[:Cname]
			email = params[:email]
			subject = params[:subject]
			message = params[:message]
			ContactsMailer.general_message(cname, email, subject, message).deliver_now

	redirect_to root_path, notice: "Your enquiry has been sent successfully. We will reply as soon as possible."
	end

end

private def contact_params
params.require(:contact).permit(:cname, :email, :subject, :message)
	
end