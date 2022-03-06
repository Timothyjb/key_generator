require_relative 'config/environment.rb'

use Rack::MethodOverride
use CsrController

run ApplicationController
