require './lib/models/peep'
require './lib/models/user'


env = ENV["RACK_ENV"] || "development"

case env

when env = 'test'
	db_path = "postgres://localhost/chitter_test"
else
	db_path = "postgres://misgzmfbcbnqnk:hs0yDyRU7Nx79OVlIJNWY7G3hO@ec2-54-243-44-191.compute-1.amazonaws.com:5432/d9l2v6bktkupdn"
end

DataMapper.setup(:default, db_path)
DataMapper.finalize
# DataMapper.auto_upgrade!
