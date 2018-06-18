require("sinatra")
require("sinatra/contrib/all")
require_relative('../models/show.rb')
also_reload('../models/*')

#INDEX
get '/shows' do
  @shows = Show.all()
  erb(:"shows/index")
end

#NEW
get '/shows/new' do
  erb(:"shows/new")
end

#SHOW
get '/shows/:id' do
  @show = Show.find(params['id'])
  erb(:"shows/show")
end

#CREATE
post '/shows' do
  @show = Show.new(params)
  @show.save
  erb(:"shows/create")
end

#EDIT
get '/shows/:id/edit' do
  @show = Show.find(params['id'])
  erb(:edit)
end
