require('pg')
require('pry-byebug')
require_relative('../db/SqlRunner')

class Customer
  attr_accessor :name, :funds
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @funds = options['funds'].to_i
    @id = options['id'].to_i if options['id']
  end 

  def save()
    sql = "INSERT INTO customers (name, funds) Values ('#{@name}', #{@funds}) RETURNING id;"

    @id = SqlRunner.run(sql)[0]['id'].to_i
  end 

  def update()
    sql = "UPDATE customers 
      SET name = '#{@name}', funds = #{@funds}
      WHERE id = #{@id};"
    result = SqlRunner.run(sql)
  end 

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON tickets.film_id = films.id WHERE tickets.customer_id = #{@id};"
    result = SqlRunner.run(sql).map {|film| Film.new(film)}
  end 

  def self.all
    sql = "SELECT * FROM customers;"
    result = SqlRunner.run(sql)
    return result.map {|customer| Customer.new(customer)}
  end 

  def self.delete_all
    sql = "DELETE FROM customers;"
    result = SqlRunner.run(sql)
  end 
 
  def buy_ticket(film)
    @funds = @funds - film.price
    update()
  end

  def tickets_count
    sql = "SELECT * FROM tickets 
    WHERE customer_id = #{@id};"
    result = SqlRunner.run(sql).count
  end 
  

end 