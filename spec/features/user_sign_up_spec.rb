require 'spec_helper'

feature "As a maker" do 

	scenario "on the homepage I will click sign up and be taken to a sign in page" do
		visit '/'
		click_link('Sign Up')
		expect(current_path).to eq('/users/new')
	end

end