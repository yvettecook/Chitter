get '/users/new' do
	@user = User.new
	erb :sign_up
end

post '/users/new' do
	@user = User.register_with(params)
	if @user.errors.any?
		flash.now[:errors] = @user.errors.full_messages
		erb :sign_up
	else
		redirect to '/'
	end
end