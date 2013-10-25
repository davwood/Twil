class MessagesController < ApplicationController

	def index
		@messages = Message.all
	end

	def new
		@message = Message.new
	end

	def create
		@message = Message.new(params[:message].permit(:countrycode, :phonenumber, :message))

		if @message.save
			number = "+" << @message.phonenumber
			message = @message.message

			@message.send_message(number,message)
			
			flash.notice = "Message Sent"
			redirect_to message_path(@message)
		else
			flash.notice = "Message not sent"
			render 'new'
		end
	end

	def show
		@message = Message.find(params[:id])
	end
end
