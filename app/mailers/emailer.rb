class Emailer < ActionMailer::Base
  default from: "LGBTHomelessness@gmail.com"

  def contact(recipient, subject, name, email, message, sent_at = Time.now)
      if message.is_a? String 
      	message_string = message
      else
      	message_string = message.to_s
      end 
      mail(to: recipient,subject: subject,
      		body: "Name: " + name + "\n" +
			"Email: " + email + "\n" + 
			"Message: " + message_string)
   end

  def volunteer(recipient, subject, name, email, message, sent_at = Time.now)
      if message.is_a? String 
      	message_string = message
      else
      	message_string = message.to_s
      end 
      mail(to: recipient,subject: subject,
      		body: "Name: " + name + "\n" +
			"Email: " + email + "\n" + 
			"Message: " + message_string)
   end
end
