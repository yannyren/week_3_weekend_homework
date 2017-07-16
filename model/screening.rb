require('pg')
require('pry-bug')
require_relative('../db/SqlRunner')

class Screening

  attr_accessor :film_id, :time
  attr_reader :id

  def initialize(options)
    @film_id = options["film_id"].to_i
    @time = options['time']
    @id = options['id'].to_i if options['id']
  end 

  def save()
    sql = "INSERT INTO screenings (film_id, time) VALUES (#{@film_id}, '#{@time}') RETURNING id;"
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end 

  def self.all()
    sql = "SELECT * FROM screenings;"
    SqlRunner.run(sql)
  end 


end 