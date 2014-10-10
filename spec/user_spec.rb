require 'user'

describe User do 

	it "should store the password securely" do
		User.create(:password => 'test')
		user = User.first
		expect(user.password_digest).not_to eq('test')
	end
	
end