class ContactController < ApplicationController

  def create
    contact =  Contact.create!(name: params[:name], email: params[:email], message: params[:message])
    if contact
      email = params[:email]
      name = params[:name]
	  recipient = "LGBTHomelessness@gmail.com"
	  subject = "LGBTH Resources Contact Form"
	  message = params[:message]
      Emailer.contact(recipient, subject, name, email, message).deliver
      return if request.xhr?
     # render :text => 
      redirect_to "/"
      puts '<B>Message sent successfully</b>'
    else
      @error = "something is missing"
    end
  end

end
