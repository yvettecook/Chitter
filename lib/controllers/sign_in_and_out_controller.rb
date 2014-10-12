post '/sign_in' do
	username, password = params[:username], params[:password]
	user = User.authenticate(username, password) 
	if user
		session[:user_id] = user.id
		redirect to '/'
	else
		flash[:notice] = "Sorry, either your username or password is incorrect"
		redirect to '/'
	end
end

post '/sign_out' do
	flash[:notice] = "Goodbye!"
	session.clear
	redirect to '/'
	erb :index
end