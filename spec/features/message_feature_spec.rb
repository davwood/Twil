require 'spec_helper'

describe 'message' do

	it 'should have a new message page' do
		visit new_message_path
		expect(page).to have_content 'New Message'
	end

	it 'new message form should allow a user to enter a country code, phone number and message' do
		visit new_message_path

		fill_in 'Country code', with: '44'
		fill_in 'Phone number', with: '7957027826'
		fill_in "Message", with: 'How are you going?'

		click_button 'Send'

		expect(page).to have_content 'Message Sent'
	end	

	it 'should require a message' do
		visit new_message_path

		fill_in 'Country code', with: 44
		fill_in 'Phone number', with: 7957027826
		fill_in "Message", with: ''

		click_button 'Send'

		expect(page).to have_content 'Message not sent'
	end

end
