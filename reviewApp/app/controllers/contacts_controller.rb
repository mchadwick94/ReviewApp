class ContactsController < ApplicationController
  def create
  	@contact = Contact.new(params[:contact])
  	if @contact.save
  		ContactsMailer.general_message(@contact).deliver
  		ContactsMailer.thanks_message(@contact).deliver
  	else
  		render 'new'
  end
end

  def new
  	@contact = Contact.new
  end
end
