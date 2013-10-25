require 'twilio-ruby'

class Message < ActiveRecord::Base

	validates :phonenumber, presence: true
	validates :message, presence: true

	def send_message(number,message)


		account_sid = "ACb769bb07fc3178bc8ab142c30373c41e"
		auth_token = "b73d11c67ea4afa668783076b2cfc4cb"
		client = Twilio::REST::Client.new(account_sid, auth_token)
	 
		from = "+441158243283" # Your Twilio number
	 	
		
		  client.account.sms.messages.create(
		    :from => from,
		    :to => number,
		    :body => message
		  ) 
	
	end

end
