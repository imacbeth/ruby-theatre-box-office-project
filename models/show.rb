require_relative('../db/sql_runner.rb')

class Show

  attr_reader :id, :name, :type
  
  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @name = options['name']
    @type = options['type']
  end

  def save()
    sql = "INSERT INTO shows (
    name, type
    )
    VALUES (
      $1, $2
      )
    RETURNING *"
    values = [@name, @type]
    show_data = SqlRunner.run(sql, values)
    @id = show_data.first['id'].to_i()
  end

  def self.delete_all()
    sql = "DELETE FROM shows"
    SqlRunner.run( sql )
  end

end
