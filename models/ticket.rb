require_relative('../db/sql_runner.rb')

class Ticket
  attr_reader :id, :performance_id, :customer_id, :price

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @performance_id = options['performance_id'].to_i
    @customer_id = options['customer_id'].to_i
    @price = options['price']
  end

  def save()
    sql = "INSERT INTO tickets
    (
    performance_id,
    customer_id,
    price
    )
    VALUES (
    $1, $2, $3
    )
    RETURNING id"
    values = [@performance_id, @customer_id, @price]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    ticket_data = SqlRunner.run(sql)
    return ticket_data.map { |ticket| Ticket.new(ticket) }
  end

  def self.find(id)
    sql = "SELECT * FROM tickets WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    ticket =  Ticket.new(result.first)
    return ticket
  end

  def delete(id)
    sql = "DELETE FROM performances WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE tickets
    SET
    (performance_id,
    customer_id,
    price
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@performance_id, @customer_id, @price, @id]
    SqlRunner.run(sql, values)
  end

  def performance()
    sql = "SELECT * FROM tickets WHERE performance_id = $1"
    values = [@performance_id]
    performance_data = SqlRunner.run(sql, values)
    return Performance.map_items(performance_data)
  end

  def customer()
    sql = "SELECT * FROM tickets WHERE customer_id = $1"
    values = [@customer_id]
    customer_data = SqlRunner.run(sql, values)
    return Customer.map_items(customer_data)
  end

  def self.map_items(ticket_data)
    result = ticket_data.map { |ticket| Ticket.new( ticket ) }
    return result
  end

end
