require('pry')
require_relative('../models/show.rb')
require_relative('../models/performance.rb')

Show.delete_all()

show1 = Show.new({
  "name" => "Macbeth",
  "type" => "Play"
  })
show2 = Show.new({
  "name" => "Fun Home",
  "type" => "Musical"
  })
show3 = Show.new({
  "name" => "The Ferryman",
  "type" => "Play"
  })
show4 = Show.new({
  "name" => "Swan Lake",
  "type" => "Ballet"
  })

show1.save()
show2.save()
show3.save()
show4.save()

binding.pry
nil
