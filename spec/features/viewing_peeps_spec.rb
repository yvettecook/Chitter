ENV["RACK_ENV"] = 'test'

require 'capybara/rspec'
require 'capybara-webkit'
require './lib/router.rb'
require 'database_cleaner'
Capybara.javascript_driver = :webkit

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)

  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean 
  end

end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end

feature "From the homepage as a visitor" do

	before(:each) do
		Peep.create(:id => 12, :content => 'This is a test peep', :user_id => 1)
		Peep.create(:id => 13, :content => 'This is a second test peep', :user_id => 1)
	end

	xscenario "any visitor should be able to see a list of peeps", :js => true do
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


end

	# Trying to find a better way to test peeps
	# scenario "2 // peeps should have the name of the user and their username" do
	# 	peeps = page.all("ul.peeps li div.content")
	# 	expect(peeps[0]).to have_content 'This is a test peep'
	# 	expect(peeps[0]).to have_content 'ynzc'
	# 	expect(peeps[1]).to have_content 'This is a second test peep'
	# 	expect(peeps[1]).to have_content 'ynzc'
	# end
