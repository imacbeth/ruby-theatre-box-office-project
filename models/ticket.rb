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


end
