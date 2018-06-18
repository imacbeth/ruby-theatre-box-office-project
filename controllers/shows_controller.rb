require("sinatra")
require("sinatra/contrib/all")
require_relative('../models/show.rb')
also_reload('../models/*')

#INDEX

get '/shows' do
  @shows = Show.all()
  erb(:"shows/index")
end
