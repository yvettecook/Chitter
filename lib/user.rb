require 'bcrypt'

class User

	include DataMapper::Resource

	property :id,								Serial
	property :email,						String
	property :name,							String
	property :username,					String
	property :password_digest,	Text

	validates_presence_of :email, :name, :username, :password_digest

	def password=(password)
		return "Password required" if password.length < 1
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end 

end