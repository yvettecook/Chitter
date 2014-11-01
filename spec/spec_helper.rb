ENV["RACK_ENV"] = 'test'

require 'capybara/rspec'
require './lib/router.rb'
require 'database_cleaner'


Capybara.app = Sinatra::Application

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

  def sign_in(username, password)
    visit '/'
    within('#sign_in') do
      fill_in 'username', with: username
      fill_in 'password', with: password
      click_button 'Sign In'
    end
  end


end
