require("sinatra")
require("sinatra/contrib/all")
require_relative('../models/performance.rb')
require_relative('../models/ticket.rb')
also_reload('../models/*')

# #INDEX
#
# get '/tickets' do
#   @tickets = Ticket.all()
#   erb(:"tickets/index")
# end

# #DELETE
# post '/tickets/:id/delete' do
#   ticket = Ticket.find(params[:id])
#   ticket.delete()
#   redirect to '/tickets'
# end
