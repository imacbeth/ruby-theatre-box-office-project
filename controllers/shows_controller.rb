require("sinatra")
require("sinatra/contrib/all")
require_relative('../models/show.rb')
require_relative('../models/performance.rb')
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
  @show = Show.find(params[:id].to_i)
  @performances = @show.performances()
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
  @show = Show.find(params[:id].to_i)
  erb(:"shows/edit")
end

#UPDATE
post '/shows/:id' do
  Show.new(params).update()
  redirect to '/shows'
end

#DELETE
post '/shows/:id/delete' do
  show = Show.find(params[:id])
  show.delete
  redirect to '/shows'
end
