require('pry')
require_relative('../models/show.rb')
require_relative('../models/performance.rb')
require_relative('../models/ticket.rb')

Show.delete_all()
Performance.delete_all()

show1 = Show.new({
  "name" => "Macbeth",
  "type" => "Play"
  })
show2 = Show.new({
  "name" => "Lion King",
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

show5 = Show.new({
  "name" => "Dylan Moran",
  "type" => "Comedy"
  })

show1.save()
show2.save()
show3.save()
show4.save()
show5.save()

performance1 = Performance.new({
  "show_id" => show1.id,
  "start_time" => "2018-08-02 19:00",
  "empty_seats" => 80,
  "price" => 20
  })

performance2 = Performance.new({
  "show_id" => show2.id,
  "start_time" => "2018-08-03 19:30:00",
  "empty_seats" => 100,
  "price" => 20
  })

performance3 = Performance.new({
  "show_id" => show3.id,
  "start_time" => "2018-08-04 19:30:00",
  "empty_seats" => 200,
  "price" => 20
  })

performance4 = Performance.new({
  "show_id" => show4.id,
  "start_time" => "2018-08-05 15:30:00",
  "empty_seats" => 250,
  "price" => 20
  })
performance5 = Performance.new({
  "show_id" => show5.id,
  "start_time" => "2018-08-07 20:00:00",
  "empty_seats" => 250,
  "price" => 20
  })

performance1.save()
performance2.save()
performance3.save()
performance4.save()
performance5.save()

ticket1 = Ticket.new({
  "performance_id" => performance1.id,
})
ticket2 = Ticket.new({
  "performance_id" => performance2.id
})
ticket3 = Ticket.new({
  "performance_id" => performance3.id
})
ticket4 = Ticket.new({
  "performance_id" => performance4.id
})
ticket5 = Ticket.new({
  "performance_id" => performance5.id
})
ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()
ticket5.save()

ticket6 = Ticket.new({
  "performance_id" => performance1.id
})
ticket6.save()
ticket7 = Ticket.new({
  "performance_id" => performance2.id
})
ticket7.save()

ticket8 = Ticket.new({
  "performance_id" => performance3.id
})
ticket8.save()

ticket9 = Ticket.new({
  "performance_id" => performance4.id
})
ticket9.save()

ticket10 = Ticket.new({
  "performance_id" => performance5.id
})
ticket10.save()


ticket11 = Ticket.new({
  "performance_id" => performance1.id
})
ticket11.save()
ticket12 = Ticket.new({
  "performance_id" => performance2.id
})
ticket12.save()

ticket13 = Ticket.new({
  "performance_id" => performance3.id
})
ticket13.save()

ticket14 = Ticket.new({
  "performance_id" => performance4.id
})
ticket14.save()

ticket15 = Ticket.new({
  "performance_id" => performance5.id
})
ticket15.save()



binding.pry
nil
