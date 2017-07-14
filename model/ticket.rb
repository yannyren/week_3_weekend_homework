require('pg')
require('pry-byebug')
require_relative('../db/SqlRunner')

class Ticket

  
  attr_reader :film_id, :customer_id, :id

  def initialize(options)
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
    @id = options['id'].to_i if options['id']
  end 

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id) Values (#{@customer_id}, #{@film_id}) RETURNING id;"
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end  

 def update()
   sql = "UPDATE tickets 
     SET customer_id = #{@customer_id}, film_id = #{@film_id}
     WHERE id = #{@id};"
   result = SqlRunner.run(sql)
 end 

  
  def self.all
    sql = "SELECT * FROM tickets;"
    result = SqlRunner.run(sql)
    return result.map {|ticket| Customer.new(ticket)}
  end 

  def self.delete_all
    sql = "DELETE FROM tickets;"
    result = SqlRunner.run(sql)
  end 

end 