
get '/users/new' do
	@user = User.new
	erb :sign_up
end

post '/users/new' do
	@user = User.new(:email => params[:email], 
									:name => params[:name],
									:username => params[:username], 
									:password => params[:password])
	if @user.save
		redirect to '/'
	else
		flash.now[:errors] = @user.errors.full_messages
		erb :sign_up
	end
end