class SubscriberMailer < ApplicationMailer
 def welcome_email(subscriber)
 	@subscriber = subscriber
 	 mail( :to => @subscriber.email,
    :subject => 'Thanks for subscribing to our amazing app' )
	end
end