require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'
require 'json'
set :partial_template_engine, :erb

require_relative 'models/user'
require_relative 'models/peep'

require './lib/helpers/helper'
require './lib/helpers/datamapper_setup'

enable :sessions
set :session_secret, 'secret'
use Rack::Flash
set :public_folder, File.dirname(__FILE__) + "./public"
require_relative 'controllers/sign_in_and_out_controller'
require_relative 'controllers/new_peep_controller'
require_relative 'controllers/homepage_controller'
