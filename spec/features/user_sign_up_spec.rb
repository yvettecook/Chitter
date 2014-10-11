require 'spec_helper'

feature "As a maker wanting to sign up" do 

	scenario "on the homepage I will click sign up and be taken to a sign in page" do
		visit '/'
		click_link('Sign Up')
		expect(current_path).to eq('/users/new')
	end

	scenario "on the sign in page I will enter my details, and a new user will be created" do
		sign_up("yvettecook@gmail.com", "yvette", "ynzc", "test")
		expect(User.count).to eq 1
		user = User.first
		expect(user.email).to eq "yvettecook@gmail.com" 
		expect(user.name).to eq "yvette" 
		expect(user.username).to eq "ynzc"
	end

	scenario "sign up form should require all fields filled out" do
		sign_up("yvettecook@gmail.com", "yvette", "ynzc", "")
		expect(current_path).to eq '/users/new'
		expect(User.count).to eq 0
		expect(page).to have_content "Password digest must not be blank"
	end

	scenario "I should be notified if a username is already taken" do
		sign_up("yvettecook@gmail.com", "yvette", "ynzc", "test")
		sign_up("new@test.com", "yvette", "ynzc", "test")
		expect(User.count).to eq 1
		expect(page).to have_content "Username is already taken"
	end


	def sign_up(email, name, username, password)
		visit '/users/new'
		fill_in 'email', with: email
		fill_in 'name', with: name
		fill_in 'username', with: username
		fill_in 'password', with: password
		click_button 'Sign Up'
	end

end