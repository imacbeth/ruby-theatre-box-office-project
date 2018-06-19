require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/performances_controller')
require_relative('controllers/shows_controller')
require_relative('controllers/tickets_controller')
also_reload("./models/*")

#INDEX
get '/' do
  erb(:index)
end
