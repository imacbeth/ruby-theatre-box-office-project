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

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

    def self.all()
      sql = "SELECT * FROM customers"
      customer_data = SqlRunner.run(sql)
      return Customer.map_items(customer_data)
    end

    def self.find(id)
      sql = "SELECT * FROM customers WHERE id = $1"
      values = [id]
      result = SqlRunner.run(sql, values)
      customer =  Customer.new(result.first)
      return customer
    end

    def delete(id)
      sql = "DELETE FROM customers WHERE id = $1"
      values = [id]
      SqlRunner.run(sql, values)
    end

    def update()
      sql = "UPDATE customers
      SET
      (name,
      wallet,
      email
      ) =
      (
        $1, $2, $3
      )
      WHERE id = $4"
      values = [@name, @wallet, @email, @id]
      SqlRunner.run(sql, values)
    end

  def buy_a_ticket(ticket)
    performance = ticket.performance
    price = ticket.price
    return if performance.check_availability == "Sold out"
  end

  def self.map_items(customer_data)
    result = customer_data.map { |customer| Customer.new( customer ) }
    return result
  end

end
