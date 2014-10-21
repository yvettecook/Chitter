require './lib/models/user'

describe User do 

	context "when creating new users" do

		it "makes sure the user data is correct" do
			user = User.create(:email => 'testr@test.com', :name => 'stest', :username => 'usesrname', :password => 'test')
			expect(user).to be_valid
		end

		it "should store the password securely" do
			user = User.new
			user.password=('test')
			expect(user.password_digest).not_to equal('test')
		end

		it "should raise not create a user if the password is not supplied" do
			user = User.new(:email => 'new@test.com', :name => 'new', :username => 'test', :password => '')
			expect(user).not_to be_valid
		end
		
		it "should not save a user if name is not supplied on creation" do
			user = User.new(:email => 'new@test.com', :username => 'new', :password => 'test')
			expect(user).not_to be_valid
		end

	end

	context "validating uniqueness" do

		before(:each) do
		User.create(:email => 'test@test.com', :name => 'test', :username => 'username', :password => 'test')
		end

		it "it should validate that email supplied is unique" do
			user = User.new(:email => 'test@test.com', :name => 'test', :username => 'username', :password => 'test')
			expect(user).not_to be_valid
		end

		it "it should validate that username supplied is unique" do
			user = User.new(:email => 'new@test.com', :name => 'new', :username => 'username', :password => 'test')
			expect(user).not_to be_valid
		end

	end

	context "when authenticating users" do

		it "should be able to autheticate users from username and password" do
			user = double :user, password_digest: ''
			allow(BCrypt::Password).to receive(:new).and_return('test')
			allow(User).to receive(:first).and_return(user)

			expect(User.authenticate('username','test')).to equal user
		end

		it "should not autheticate users with incorrect password" do
			user = double :user, password_digest: ''
			allow(BCrypt::Password).to receive(:new).and_return('har')
			allow(User).to receive(:first).and_return(user)
			expect(User.authenticate('username','wrong')).to be(false)
		end

		it "should not autheticate users that are not registered" do
			allow(User).to receive(:first).and_return(nil)
			expect(User.authenticate('new','test')).to be(false)
		end

	end
		

end