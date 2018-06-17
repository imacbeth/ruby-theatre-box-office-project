require_relative('../db/sql_runner.rb')

class Performance
  attr_reader :id, :show_id, :start_time, :seating_capacity

  def initialize(options)
    @id = options['id']
    @show_id = options['show_id']
    @start_time = options['start_time']
    @seating_capacity = options['seating_capacity']
  end

  def save()
    sql = "INSERT INTO performances
    (
    show_id,
    start_time,
    seating_capacity
    )
    VALUES (
    $1, $2, $3
    )
    RETURNING *"
    values = [@show_id, @start_time, @seating_capacity]
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
    seating_capacity
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@show_id, @start_time, @seating_capacity, @id]
    SqlRunner.run(sql,values)
  end

end
