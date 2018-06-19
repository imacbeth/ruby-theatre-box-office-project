require("sinatra")
require("sinatra/contrib/all")
require_relative('../models/performance.rb')
also_reload('../models/*')

#INDEX

get '/performances' do
  @performances = Performance.all()
  erb(:"performances/index")
end

#NEW
get '/performances/new' do
  @shows = Show.all()
  erb(:"performances/new")
end

#SHOW
get '/performances/:id' do
  @performance = Performance.find(params[:id].to_i)
  erb(:"performances/show")
end

#CREATE
post '/performances' do
  @performance = Performance.new(params)
  @performance.save
  erb(:"performances/create")
end

#EDIT
get '/performances/:id/edit' do
  @performance = Performance.find(params[:id].to_i)
  erb(:"performances/edit")
end

#UPDATE
post '/performances/:id' do
  Performance.new(params).update()
  redirect to '/performances'
end

#DELETE
post '/performances/:id/delete' do
  performance = Performance.find(params[:id])
  performance.delete
  redirect to '/performances'
end
