require './lib/models/peep'

describe Peep do 

	it "should contain text" do
		peep = Peep.new(content: 'test peep', user_id: 1)
		expect(peep).to be_valid
	end

	it "should not be longer than 140 characters" do
		peep = Peep.new(content: 'this peep is far far far far far far far far far far far far far far far far far far far far far far far far far far far far far far far too long')
		expect(peep).not_to be_valid 
	end
	
	it "should be linked to the user that wrote it" do
		peep = Peep.new(:user_id => 12, :content => 'This is a test peep')
		expect(peep.user_id).to eq(12)
	end

end

