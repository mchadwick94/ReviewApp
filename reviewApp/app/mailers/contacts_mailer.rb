class ContactsMailer < ApplicationMailer

def general_message(cname, email, subject, message)
    @cname = cname
    @email = email
    @subject = subject
    @message = message
    mail(to: "mchadwick1994@gmail.com", subject: "Contact Message from <%= contact.email %>.")
  end

end
