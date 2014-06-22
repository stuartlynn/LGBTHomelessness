# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
LGBTHomelessness::Application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'lgbthomelessness.com',
  user_name:            ENV['GMAIL_USERNAME'],
  password:             ENV['GMAIL_PASSWORD'],
  authentication:       'plain',
  enable_starttls_auto: true  
}