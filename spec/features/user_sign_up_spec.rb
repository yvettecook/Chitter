require 'spec_helper'

feature "As a maker wanting to sign up" do 

	scenario "on the home page I will enter my details, and a new user will be created" do
		sign_up("yvettecook@gmail.com", "yvette", "ynzc", "test")
		expect(User.count).to eq 1
		user = User.first
		expect(user.email).to eq "yvettecook@gmail.com" 
		expect(user.name).to eq "yvette" 
		expect(user.username).to eq "ynzc"
	end

	scenario "sign up form should require all fields filled out" do
		sign_up("yvettecook@gmail.com", "yvette", "ynzc", "")
		expect(current_path).to eq '/'
		expect(User.count).to eq 0
		expect(page).to have_content "Password digest must not be blank"
	end

	scenario "I should be notified if a username is already taken" do
		sign_up("yvettecook@gmail.com", "yvette", "ynzc", "test")
		sign_up("new@test.com", "yvette", "ynzc", "test")
		expect(User.count).to eq 1
		expect(page).to have_content "Username is already taken"
	end

	scenario "I should be notified if a email is already registered" do
		sign_up("yvettecook@gmail.com", "yvette", "ynzc", "test")
		sign_up("yvettecook@gmail.com", "yvette", "test", "test")
		expect(User.count).to eq 1
		expect(page).to have_content "Email is already taken"
	end


	def sign_up(email, name, username, password)
		visit '/'
		within('.sign_up') do
			fill_in 'email', with: email
			fill_in 'name', with: name
			fill_in 'username', with: username
			fill_in 'password', with: password
			click_button 'Sign Up'
		end
	end

end