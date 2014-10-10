require 'sinatra'
require 'data_mapper'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
require './lib/user'
DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do
	erb :index
end

get '/users/new' do
	erb :sign_up
end

post '/users/new' do
	email = params[:email]
	name = params[:name]
	username = params[:username]
	password = params[:password]
	User.create(:email => email, :name => name, :username => username, :password => password)
end
