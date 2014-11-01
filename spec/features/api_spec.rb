require 'spec_helper'

feature 'As a data crawler accessing the api' do

	before(:each) do
		User.create(:id => 1, :email => 'test@test.com', :name => 'Yvette', :username => 'ynzc', :password => 'test')		
		Peep.create(:id => 12, :content => 'This is a test peep', :user_id => 1)
	end

	scenario 'there should be peep id on the page' do
		visit '/api/peeps'
		expect(page).to have_content '"id":12'
	end

	scenario 'there should be peep content on the page' do
		visit '/api/peeps'
		expect(page).to have_content '"content":"This is a test peep"'
	end

	scenario 'there should be peep user_id on the page' do
		visit '/api/peeps'
		expect(page).to have_content '"user_id":1'
	end

	scenario 'there should be users name on the page' do
		visit '/api/peeps'
		expect(page).to have_content '"name":"Yvette"'
	end

	scenario 'there should be the user_name on the page' do
		visit '/api/peeps'
		expect(page).to have_content '"username":"ynzc"'
	end

end