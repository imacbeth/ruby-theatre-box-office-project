require_relative('../db/sql_runner.rb')

class Customer
  attr_reader :id, :name, :wallet, :email

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @name = options['name']
    @wallet = options['wallet'].to_i
    @email = options['email']
  end

  def save()
    sql = "INSERT INTO customers
    (
    name,
    wallet,
    email
    )
    VALUES (
    $1, $2, $3
    )
    RETURNING id"
    values = [@name, @wallet, @email]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  
end
