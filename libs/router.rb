require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'
require 'json'
require './lib/helpers/helper'
require './lib/helpers/datamapper_setup'

require_relative 'models/user'
require_relative 'models/peep'

set :partial_template_engine, :erb

enable :sessions
set :session_secret, 'secret'
use Rack::Flash

set :public_dir, Proc.new { File.join(root, "public")}
set :public_folder, 'public'

require_relative 'controllers/sign_in_and_out_controller'
require_relative 'controllers/new_peep_controller'
require_relative 'controllers/homepage_controller'
