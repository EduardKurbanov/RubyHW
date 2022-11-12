require 'rack'
require './app/pet_app'

use Rack::Reloader, 0
use Rack::Auth::Basic do |username, password|
  username == 'admin' && password == 'admin'
end

run Application.new