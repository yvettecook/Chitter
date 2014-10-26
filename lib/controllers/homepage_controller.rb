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

get '/peeps' do
	content_type :json
	@peeps = Peep.all
	@peeps.to_json
end