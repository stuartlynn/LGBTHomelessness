class EmailerController < ApplicationController
	def sendmail
      email = @params["email"]
      name = @params["name"]
	  recipient = "LGBTHomelessness@gmail.com"
	  subject = "LGBTH Resources Contact Form"
	  message = email["message"]
      Emailer.deliver_contact(recipient, subject, name, email, message)
      return if request.xhr?
      render :text => 'Message sent successfully'
   end

end
