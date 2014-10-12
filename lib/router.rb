require 'sinatra'
require 'data_mapper'
require 'rack-flash'

require_relative 'models/user'
require_relative 'models/peep'

require './lib/helpers/helper'
require './lib/helpers/datamapper_setup'

enable :sessions
set :session_secret, 'secret'
use Rack::Flash

require_relative 'controllers/users_controller'
require_relative 'controllers/sign_in_and_out_controller'
require_relative 'controllers/new_peep_controller'
require_relative 'controllers/homepage_controller'








