get '/' do
	@peep = Peep.new
	@user = User.new
	erb :index
end


post '/' do
	@user = User.register_with(params)
	if @user.errors.any?
		flash.now[:errors] = @user.errors.full_messages
		erb :index
	else
		redirect to '/'
	end
end

get '/api/peeps' do
	content_type :json
	@peeps = Peep.all
	@peep_feed = @peeps.to_json(
		:relationships => { 
			:user => {:exclude => [:password_digest, :email]} 
		} 
	)
end
