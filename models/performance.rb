require_relative('../db/sql_runner.rb')
require('date')
require('time')
require_relative('../models/ticket.rb')

class Performance
  attr_reader :id, :show_id, :start_time, :empty_seats, :price

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @show_id = options['show_id'].to_i
    @start_time = options['start_time']
    @empty_seats = options['empty_seats'].to_i
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO performances
    (
    show_id,
    start_time,
    empty_seats,
    price
    )
    VALUES (
    $1, $2, $3, $4
    )
    RETURNING *"
    values = [@show_id, @start_time, @empty_seats, @price]
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

  def delete()
    sql = "DELETE FROM performances WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE performances
    SET
    (show_id,
    start_time,
    empty_seats,
    price
    ) =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@show_id, @start_time, @empty_seats, @price, @id]
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
    counter = 0
    while counter < quantity
      Ticket.new('performance_id' => @id).save
      counter += 1
    end
  end


  def calculate_takings()
    return tickets() * @price
  end

  def check_availability()
    if @empty_seats > 70
      return "High-availability"
    elsif @empty_seats > 30
      return "Medium-availability"
    elsif @empty_seats  >= 1
        return "Low-availability"
    elsif  @empty_seats == 0
      return "Sold-out"
    end
  end

  def self.map_items(performance_data)
    result = performance_data.map { |performance| Performance.new( performance ) }
    return result
  end

  def get_formatted_start_time()
     DateTime.parse(@start_time).strftime('%a, %e %b %Y %H:%M')
  end


end
