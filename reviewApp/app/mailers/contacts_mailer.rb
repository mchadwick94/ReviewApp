class ContactsMailer < ApplicationMailer

	  def general_message(contact)
    @contact = contact
    mail(to: "mchadwick1994@gmail.com", subject: "Contact Message from <%= contact.email %>.")
  end

    def thanks_message(contact)
    @contact = contact
    mail(to: contact.email, subject: "Message Recieved.")
  end
end
