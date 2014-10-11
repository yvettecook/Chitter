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

	it "should be able to autheticate users from username and password" do
		user = User.create(:email => 'test@test.com', :name => 'test', :username => 'username', :password => 'test')
		expect(User.authenticate('username','test')).not_to be(false)
	end

	it "should not autheticate users with incorrect password" do
		user = User.create(:email => 'test@test.com', :name => 'test', :username => 'username', :password => 'test')
		expect(User.authenticate('username','wrong')).to be(false)
	end

	it "should not autheticate users that are not registers" do
		expect(User.authenticate('username','test')).to be(false)
	end
		

	# it "email and username must be unique" do

	# end


end