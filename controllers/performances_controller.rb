require("sinatra")
require("sinatra/contrib/all")
require_relative('../models/performance.rb')
also_reload('../models/*')

#INDEX

get '/performances' do
  @performances = Performance.all()
  erb(:"performances/index")
end
