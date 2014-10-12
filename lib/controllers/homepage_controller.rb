get '/' do
	@peep = Peep.new
	erb :index
end