require 'spec_helper'

feature "From the homepage" do

	scenario "a user should be able to write a short peep" do
		visit '/'
		fill_in 'content', with: 'This is a test peep'
		click_button 'Peep it!'
		expect(Peep.count).to eq(1)
	end

end
