require 'spec_helper'

feature "From the homepage, wanting to share" do

	before(:each) do
		User.create(:email => 'test@test.com', :name => 'Yvette', :username => 'ynzc', :password => 'test')
	end

	scenario "a user should be able to write a short peep" do
		visit '/'
		sign_in('ynzc', 'test')
		fill_in 'content', with: 'This is a test peep'
		click_button 'Peep it!'
		expect(Peep.count).to eq(1)
	end

	scenario "if a user writes a peep that's too long, an error message will be raised" do
		visit '/'
		sign_in('ynzc', 'test')
		fill_in 'content', with: 'this peep is far far far far far far far far far far far far far far far far far far far far far far far far far far far far far far far too long'
		click_button 'Peep it!'
		expect(Peep.count).to eq(0)
		expect(page).to have_content 'Content must be at most 140 characters long'
		expect(page).to have_selector("input[@value='this peep is far far far far far far far far far far far far far far far far far far far far far far far far far far far far far far far too long']")
	end

	scenario "if a user isn't logged in, they cannot write a peep" do
		visit '/'
		expect(page).not_to have_content 'Peep it!'
	end

	def sign_in(username, password)
		visit '/'
		within('.sign_in') do
			fill_in 'username', with: username
			fill_in 'password', with: password
			click_button 'Sign In'
		end
	end

	def test_peeps
		sign_in('ynzc', 'test')
		fill_in 'content', with: 'This is a test peep'
		click_button 'Peep it!'
		fill_in 'content', with: 'This is a second test peep'
		click_button 'Peep it!'
		click_button 'Sign Out'
	end

end
