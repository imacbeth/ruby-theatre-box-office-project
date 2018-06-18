require('pry')
require_relative('../models/show.rb')
require_relative('../models/performance.rb')

Show.delete_all()
Performance.delete_all()

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
  "type" => "Dance"
  })

show1.save()
show2.save()
show3.save()
show4.save()

performance1 = Performance.new({
  "show_id" => show1.id,
  "start_time" => "2018-08-02 19:00",
  "seating_capacity" => 80
  })

performance2 = Performance.new({
  "show_id" => show2.id,
  "start_time" => "2018-08-03 19:30:00",
  "seating_capacity" => 100
  })

performance3 = Performance.new({
  "show_id" => show3.id,
  "start_time" => "2018-08-04 19:30:00",
  "seating_capacity" => 200
  })

performance4 = Performance.new({
  "show_id" => show4.id,
  "start_time" => "2018-08-05 15:30:00",
  "seating_capacity" => 250
  })

performance1.save()
performance2.save()
performance3.save()
performance4.save()


binding.pry
nil
