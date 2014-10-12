class Peep

	include DataMapper::Resource

	property :id, 				Serial
	property :content,		String, 	:length => 140 	

	belongs_to :user
	
end