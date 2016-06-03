# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :domain => 'blackrockmillingdev.herokuapp.com',
  :authentication => :plain,
  :user_name => 'blackrocksmtp',
  :password => 'oj$*(KdB--9848'
}