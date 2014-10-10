require 'user'

describe User do 

	it "should store the password securely" do
		User.create(:email => 'test@test.com', :name => 'test', :username => 'test', :password => 'test')
		user = User.first
		expect(user.password_digest).not_to eq('test')
	end

	it "should raise an error if password is not supplied on sign up" do
		User.create(:email => 'test@test.com', :name => 'test', :username => 'test', :password => '')
		expect(User.count).to be 0
	end
	
	it "should not save a user if name is not supplied on sign up" do
		User.create(:email => 'test@test.com', :username => 'test', :password => 'test')
		expect(User.count).to be 0
	end

end