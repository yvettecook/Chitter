class Peep

	include DataMapper::Resource

	property :id, 				Serial
	property :content,		String, 	:length => 140 

	belongs_to :user

	def self.peep_with(params)
		Peep.create(params)
	end

end