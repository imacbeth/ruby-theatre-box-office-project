require_relative('../db/sql_runner.rb')


class Performance
  attr_reader :id, :show_id, :start_time, :empty_seats

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @show_id = options['show_id'].to_i
    @start_time = options['start_time']
    @empty_seats = options['empty_seats'].to_i
  end

  def save()
    sql = "INSERT INTO performances
    (
    show_id,
    start_time,
    empty_seats
    )
    VALUES (
    $1, $2, $3
    )
    RETURNING *"
    values = [@show_id, @start_time, @empty_seats]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM performances"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM performances"
    performance_data = SqlRunner.run(sql)
    return performance_data.map { |performance| Performance.new(performance) }
  end

  def self.find(id)
    sql = "SELECT * FROM performances WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    performance = Performance.new(result.first)
    return performance
  end

  def delete(id)
    sql = "DELETE FROM performances WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE performances
    SET
    (show_id,
    start_time,
    empty_seats
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@show_id, @start_time, @empty_seats, @id]
    SqlRunner.run(sql, values)
  end

  def show()
    sql = "SELECT * FROM shows WHERE id = $1"
    values = [@show_id]
    results = SqlRunner.run(sql, values)
    return Show.new(results.first)
  end

  def tickets()
    sql = "SELECT * FROM tickets WHERE performance_id = $1"
    values = [@id]
    results = SqlRunner.run(sql,values)
    return Ticket.map_items(results).count
  end

  def sell_tickets(quantity)
    @empty_seats -= quantity
    update()
  end
  #
  # def sold_tickets()
  #   sql = "SELECT COUNT (*) FROM tickets WHERE performance_id = $1"
  #   values = [@id]
  #   results = SqlRunner.run(sql,values)
  #   return Ticket.map_items(results)
  # end
  #
  def check_availability()
    if tickets() < @empty_seats / 2
      return "High availability"
    elsif tickets() > @empty_seats / 2
      return "Medium availability"
    elsif tickets() == @empty_seats
      return "Sold out"
    end
  end

  def self.map_items(performance_data)
    result = performance_data.map { |performance| Performance.new( performance ) }
    return result
  end

end
