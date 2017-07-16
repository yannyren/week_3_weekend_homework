require('pg')
require('pry-byebug')
require_relative('../db/SqlRunner')

class Film

  attr_accessor :title, :price
  attr_reader :id

  def initialize(options)
    @title = options['title']
    @price = options['price'].to_i
    @id = options['id'].to_i if options['id']
  end 

  def save()
    sql = "INSERT INTO films (title, price) Values ('#{@title}', #{@price}) RETURNING id;"
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end 

 def update()
   sql = "UPDATE films 
     SET title = '#{@title}', price = #{@price}
     WHERE id = #{@id};"
   SqlRunner.run(sql)
 end 

  def customers()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON tickets.customer_id = customers.id WHERE tickets.film_id = #{@id};"
    SqlRunner.run(sql).map {|customer| Film.new(customer)}
  end  
  
  def self.all
    sql = "SELECT * FROM films;"
    result = SqlRunner.run(sql)
    return result.map {|film| Customer.new(film)}
  end 

  def self.delete_all
    sql = "DELETE FROM films;"
    SqlRunner.run(sql)
  end 

  def customer_count
    sql = "SELECT * FROM tickets WHERE film_id = #{@id};"
    SqlRunner.run(sql).count
  end 

  def list_time
    sql = "SELECT films.* FROM films INNER JOIN screenings ON screenings.film_id = films.id WHERE films.id = #{@id};"
    SqlRunner.run(sql)
  end 

 
end 