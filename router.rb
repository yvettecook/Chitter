require 'sinatra'
require 'data_mapper'
require 'rack-flash'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
require './lib/user'
require './lib/helper'
require './lib/peep'
DataMapper.finalize
DataMapper.auto_upgrade!

enable :sessions
set :session_secret, 'secret'
use Rack::Flash

get '/' do
	@peep = Peep.new
	erb :index
end

post '/sign_in' do
	username, password = params[:username], params[:password]
	user = User.authenticate(username, password) 
	if user
		session[:user_id] = user.id
		redirect to '/'
	else
		flash[:notice] = "Sorry, either your username or password is incorrect"
	end
end

post '/sign_out' do
	flash[:notice] = "Goodbye!"
	session.clear
	redirect to '/'
	erb :index
end

post '/new_peep' do
	@peep = Peep.new(:user_id => session[:user_id],:content => params[:content])
	if @peep.save
		redirect to '/'
	else
		flash.now[:errors] = @peep.errors.full_messages
		erb :index
	end
end

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
