require 'spec_helper'

feature "As a registered user" do 

	before(:each) do
		User.create(:email => 'test@test.com', :name => 'Yvette', :username => 'ynzc', :password => 'test')
	end

	scenario "There should be a sign in button on the homepage" do 
		visit '/'
		expect(page).to have_content('Sign In')
	end

	scenario "I should be able to fill out my username and password and sign in" do 
		visit '/'
		fill_in 'username', with: 'ynzc'
		fill_in 'password', with: 'test'
		click_button 'Sign In'
		expect(page).to have_content 'Welcome Yvette'
	end

	scenario "I should be prompted if I enter incorrect sign in details" do 
		visit '/'
		fill_in 'username', with: 'ynzc'
		fill_in 'password', with: 'wrong'
		click_button 'Sign In'
		expect(page).to have_content 'Sorry, either your username or password is incorrect'
	end
end