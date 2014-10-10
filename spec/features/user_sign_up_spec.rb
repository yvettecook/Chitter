require 'spec_helper'

feature "As a maker" do 

	scenario "on the homepage I will click sign up and be taken to a sign in page" do
		visit '/'
		click_link('Sign Up')
		expect(current_path).to eq('/users/new')
	end

	scenario "on the sign in page I will enter my details, and a new user will be created" do
		visit '/users/new'
		fill_in 'email', with: "yvettecook@gmail.com"
		fill_in 'name', with: "yvette"
		fill_in 'username', with: "ynzc"
		fill_in 'password', with: "test"
		click_button 'Sign Up'
		expect(User.count).to eq(1)
		user = User.first
		expect(user.email).to eq("yvettecook@gmail.com")
		expect(user.name).to eq("yvette")
		expect(user.username).to eq("ynzc")
	end

	#will pull out sign in process to seperate definition?
end