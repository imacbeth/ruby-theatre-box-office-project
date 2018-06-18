require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/performances_controller')
require_relative('controllers/shows_controller')

#INDEX
get '/' do
  erb(:index)
end
