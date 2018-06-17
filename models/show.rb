require_relative('../db/sql_runner.rb')

class Show

  attr_reader :id, :name, :type

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @name = options['name']
    @type = options['type']
  end

  def save()
    sql = "INSERT INTO shows
    (
    name, type
    )
    VALUES (
      $1, $2
      )
    RETURNING *"
    values = [@name, @type]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i()
  end

  def self.delete_all()
    sql = "DELETE FROM shows"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM shows"
    show_data = SqlRunner.run(sql)
    return show_data.map { |show| Show.new(show) }
  end

  def delete(id)
    sql = "DELETE FROM shows WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end


end
