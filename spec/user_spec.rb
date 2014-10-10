require 'user'

describe User do 

	it "should store the password securely" do
		User.create(:email => 'test@test.com', :name => 'test', :username => 'test', :password => 'test')
		user = User.first
		expect(user.password_digest).not_to eq('test')
	end

	it "should raise an error if password is not supplied on sign up" do
		expect { User.create(:email => 'test@test.com', :name => 'test', :username => 'test', :password => '') }.to raise_error RuntimeError
	end
	
end