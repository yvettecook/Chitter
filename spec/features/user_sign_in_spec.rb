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
		sign_in('ynzc', 'test')
		expect(page).to have_content 'Welcome Yvette'
	end

	scenario "I should be prompted if I enter incorrect sign in details" do 
		sign_in('ynzc', 'wrong')
		expect(page).to have_content 'Sorry, either your username or password is incorrect'
	end

	scenario "once signed in, I should be able to sign out" do
		sign_in('ynzc', 'test')
		click_button 'Sign Out'
		expect(page).not_to have_content 'Welcome Yvette'
	end

	def sign_in(username, password)
		visit '/'
		fill_in 'username', with: username
		fill_in 'password', with: password
		click_button 'Sign In'
	end

end