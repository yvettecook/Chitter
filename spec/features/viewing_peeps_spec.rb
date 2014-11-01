require 'spec_helper'

feature "From the homepage as a visitor" do

	before(:each) do
		User.create(:email => 'test@test.com', :name => 'Yvette', :username => 'ynzc', :password => 'test')
		test_peeps
	end

	scenario "any visitor should be able to see a list of peeps" do
		visit '/'
		expect(Peep.count).to eq(2)
		expect(page).to have_content 'This is a test peep'
		expect(page).to have_content 'This is a second test peep'
	end

	xscenario "peeps should have the username" do
		expect(page).to have_content 'ynzc This is a test peep'
		expect(page).to have_content 'ynzc This is a second test peep'
	end

	xscenario "peeps should have the name of the user" do
		expect(page).to have_content 'Yvette @ynzc This is a test peep'
		expect(page).to have_content 'Yvette @ynzc This is a second test peep'
	end

	def sign_in(username, password)
		visit '/'
		within('#sign_in') do
			fill_in 'username', with: username
			fill_in 'password', with: password
			click_button 'Sign In'
		end
	end


	def test_peeps
		visit '/'
		sign_in('ynzc', 'test')
		fill_in 'content', with: 'This is a test peep'
		click_button 'Peep it!'
		fill_in 'content', with: 'This is a second test peep'
		click_button 'Peep it!'
		click_button 'Sign Out'
	end

end

	# Trying to find a better way to test peeps
	# scenario "2 // peeps should have the name of the user and their username" do
	# 	peeps = page.all("ul.peeps li div.content")
	# 	expect(peeps[0]).to have_content 'This is a test peep'
	# 	expect(peeps[0]).to have_content 'ynzc'
	# 	expect(peeps[1]).to have_content 'This is a second test peep'
	# 	expect(peeps[1]).to have_content 'ynzc'
	# end
