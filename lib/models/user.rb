require 'bcrypt'

class User

	include DataMapper::Resource

	property :id,								Serial
	property :email,						String
	property :name,							String
	property :username,					String
	property :password_digest,	Text

	validates_presence_of :email, :name, :username, :password_digest
	validates_uniqueness_of :email, :username

	has n, :peeps

	def password=(password)
		return "Password required" if password.length < 1
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end 

	def self.authenticate(username, password)
		user = first(:username => username)
		if user && BCrypt::Password.new(user.password_digest) == password
			user
		else
			false
		end
	end

	def self.register_with(params)
		User.create(params)
	end
end