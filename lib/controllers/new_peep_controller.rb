post '/new_peep' do
	@peep = Peep.new(:user_id => session[:user_id],:content => params[:content])
	if @peep.save
		redirect to '/'
	else
		flash.now[:errors] = @peep.errors.full_messages
		erb :index
	end
end
