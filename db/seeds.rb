require('pry')
require_relative('../models/show.rb')
require_relative('../models/performance.rb')
require_relative('../models/ticket.rb')
require_relative('../models/customer.rb')

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

customer1 = Customer.new({
  "name" => "Alice",
  "wallet" => "50",
  "email" => "alice@gmail.com"
  })

customer2 = Customer.new({
  "name" => "Jerry",
  "wallet" => "65",
  "email" => "jerry@gmail.com"
  })

customer3 = Customer.new({
  "name" => "Iona",
  "wallet" => "60",
  "email" => "iona@gmail.com"
  })
customer4 = Customer.new({
  "name" => "Callum",
  "wallet" => "50",
  "email" => "callum@gmail.com"
  })

customer5 = Customer.new({
  "name" => "Julia",
  "wallet" => "60",
  "email" => "julia@gmail.com"
  })

customer1.save()
customer2.save()
customer3.save()
customer4.save()
customer5.save()

ticket1 = Ticket.new({
  "performance_id" => performance1.id,
  "customer_id" => customer1.id,
  "price" => 20
})
ticket2 = Ticket.new({
  "performance_id" => performance1.id,
  "customer_id" => customer2.id,
  "price" => 20
})
ticket3 = Ticket.new({
  "performance_id" => performance3.id,
  "customer_id" => customer3.id,
  "price" => 25
})
ticket4 = Ticket.new({
  "performance_id" => performance3.id,
  "customer_id" => customer4.id,
  "price" => 25
})
ticket5 = Ticket.new({
  "performance_id" => performance4.id,
  "customer_id" => customer5.id,
  "price" => 25
})
ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()
ticket5.save()

binding.pry
nil
