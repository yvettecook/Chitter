require 'sinatra'
require 'data_mapper'
require 'rack-flash'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
require './lib/user'
DataMapper.finalize
DataMapper.auto_upgrade!

enable :sessions
use Rack::Flash

get '/' do
	erb :index
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
		redirect to ('/')
	else
		flash[:notice] = "Please complete all fields"
		erb :sign_up
	end
end
