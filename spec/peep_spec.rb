require './lib/models/peep'
require './lib/models/user'

describe Peep do 

	before(:each) do
		user = User.create(:id => 12, :email => 'test@test.com', :name => 'test', :username => 'ynzc', :password => 'test')
	end
	
	it "should be linked to the user that wrote it" do
		peep = Peep.create(:user_id => 12, :content => 'This is a test peep')
		expect(peep.user_id).to eq(12)
	end

end

