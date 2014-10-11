require 'user'

describe User do 

	before(:each) do
		User.create(:email => 'test@test.com', :name => 'test', :username => 'username', :password => 'test')
	end

	it "should store the password securely" do
		user = User.first
		expect(user.password_digest).not_to eq('test')
	end

	it "should raise an error if password is not supplied on sign up" do
		User.create(:email => 'new@test.com', :name => 'new', :username => 'test', :password => '')
		expect(User.count).to be 1
	end
	
	it "should not save a user if name is not supplied on sign up" do
		User.create(:email => 'new@test.com', :username => 'new', :password => 'test')
		expect(User.count).to be 1
	end

	it "should be able to autheticate users from username and password" do
		expect(User.authenticate('username','test')).not_to be(false)
	end

	it "should not autheticate users with incorrect password" do
		expect(User.authenticate('username','wrong')).to be(false)
	end

	it "should not autheticate users that are not registered" do
		expect(User.authenticate('new','test')).to be(false)
	end
		
	it "email and username must be unique" do


	end


end