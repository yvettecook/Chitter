require 'spec_helper'

feature "From the homepage" do

	scenario "a user should be able to write a short peep" do
		visit '/'
		fill_in 'content', with: 'This is a test peep'
		click_button 'Peep it!'
		expect(Peep.count).to eq(1)
	end

	scenario "if a user writes a peep that's too long, an error message will be raised" do
		visit '/'
		fill_in 'content', with: 'this peep is far far far far far far far far far far far far far far far far far far far far far far far far far far far far far far far too long'
		click_button 'Peep it!'
		expect(Peep.count).to eq(0)
		expect(page).to have_content 'Content must be at most 140 characters long'
		expect(page).to have_selector("input[@value='this peep is far far far far far far far far far far far far far far far far far far far far far far far far far far far far far far far too long']")
	end

end
