require 'sinatra'
require 'data_mapper'
require 'rack-flash'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
require './lib/user'
require './lib/helper'
DataMapper.finalize
DataMapper.auto_upgrade!

enable :sessions
set :session_secret, 'secret'
use Rack::Flash

get '/' do
	erb :index
end

post '/sign_in' do
	username, password = params[:username], params[:password]
	user = User.authenticate(username, password) 
	if user
		session[:user_id] = user.id
		redirect to '/'
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
		flash[:notice] = "Please complete all fields"
		erb :sign_up
	end
end
