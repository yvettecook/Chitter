post '/new_peep' do
	@peep = Peep.peep_with(params)
	if @peep.save
		redirect to '/'
	else
		flash.now[:errors] = @peep.errors.full_messages
		erb :index
	end
end
