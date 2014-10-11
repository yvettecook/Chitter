require 'user'

describe User do 

	before(:each) do
		User.create(:email => 'test@test.com', :name => 'test', :username => 'username', :password => 'test')
	end

	context "when creating new users" do

		it "should store the password securely" do
			user = User.first
			expect(user.password_digest).not_to eq('test')
		end

		it "should raise an error if password is not supplied on creation" do
			User.create(:email => 'new@test.com', :name => 'new', :username => 'test', :password => '')
			expect(User.count).to be 1
		end
		
		it "should not save a user if name is not supplied on creation" do
			User.create(:email => 'new@test.com', :username => 'new', :password => 'test')
			expect(User.count).to be 1
		end

		it "it should validate that email supplied is unique" do
			User.create(:email => 'test@test.com', :name => 'test', :username => 'username', :password => 'test')
			expect(User.count).to be 1
		end

		it "it should validate that username supplied is unique" do
			User.create(:email => 'new@test.com', :name => 'new', :username => 'username', :password => 'test')
			expect(User.count).to be 1
		end

	end

	context "when authenticating users" do

		it "should be able to autheticate users from username and password" do
			expect(User.authenticate('username','test')).not_to be(false)
		end

		it "should not autheticate users with incorrect password" do
			expect(User.authenticate('username','wrong')).to be(false)
		end

		it "should not autheticate users that are not registered" do
			expect(User.authenticate('new','test')).to be(false)
		end

	end
		

end