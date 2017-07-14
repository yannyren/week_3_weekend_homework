require('pry-byebug')
require_relative('../model/customer')
require_relative('../model/film')
require_relative('../model/ticket')

# Customer.delete_all
# Film.delete_all
# Ticket.delete_all


customer1 = Customer.new({"name" => "Zoe", "funds" => 100})
customer2 = Customer.new({"name" => "Nancy", "funds" => 15})
customer3 = Customer.new({"name" => "Lilian", "funds" => 50})
customer1.save
customer2.save
customer3.save



film1 = Film.new({"title" => "One Day", "price" => 10})
film2 = Film.new({"title" => "Two Day", "price" => 20})
film3 = Film.new({"title" => "Ten Day", "price" => 15})
film1.save
film2.save
film3.save

ticket1 = Ticket.new({"customer_id" => 1, "film_id" => 1})
ticket2 = Ticket.new({"customer_id" => 1, "film_id" => 2})
ticket3 = Ticket.new({"customer_id" => 2, "film_id" => 2})
ticket4 = Ticket.new({"customer_id" => 3, "film_id" => 1})
ticket1.save
ticket2.save
ticket3.save


customer1.name = 'Bob'
customer1.funds -= 10
customer1.update

customer1.buy_ticket(film3)

customer1.tickets_count



binding.pry
nil