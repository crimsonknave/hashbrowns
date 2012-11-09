# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
#

customer1 = Customer.create({:email_address => "customer1@example.org", :first_name => "John", :last_name => :Smith, :phone => "123-456-7890"})
customer2 = Customer.create({:email_address => "customer2@example.org", :first_name => "Bob", :last_name => "Johnson", :phone => "111.111.1111"})

orders1 = Order.create([{:description => "Order of many things", :name => "Order One", :status => "Completed"}, {:description => "Replacement for missing order", :name => "Tuesday's order", :status => "Pending"}])
orders1.each do |o|
  o.customer = customer1
  o.save
end
orders2 = Order.create([{:description => "Newest order", :name => "New Order", :status => "Pending"}, {:description => "Holiday order", :name => "Foo", :status => "Canceled"}])
orders2.each do |o|
  o.customer = customer2
  o.save
end

destinations = Destination.create([{:address1 => "123 fake st", :address2 => "apt 1", :city => "Boston", :state => "MA", :phone => "111-222-3333", :zip => 12345},
                   {:address1 => "4555 foo st", :city => "Springfield", :state => "MA", :phone => "1-800-888-8888", :zip => 11111},  
                   {:address1 => "94 bar ave", :city => "Waltham", :state => "MA", :phone => "123.321.0000", :zip => 55555},  
                   {:address1 => "100 place pl", :address2 => "apt 1", :city => "Springfield", :state => "MA", :phone => "123.456.7890", :zip => 11112},  
                   {:address1 => "27 main st", :address2 => "apt 1", :city => "Cambridge", :state => "MA", :phone => "5556667777", :zip => 12321},  
                   {:address1 => "7 9th ave", :city => "Minneapolis", :state => "MN", :phone => "957.975.1358", :zip => 23432},  
                   {:address1 => "3898 baz ave", :city => "New York", :state => "NY", :phone => "121.232.4334", :zip => 12340},  
                   {:address1 => "40 doom st", :address2 => "apt 1", :city => "Sommerville", :state => "MA", :phone => "555-888-0110", :zip => 12345},  
                   {:address1 => "86 W fun circle", :city => "Boston", :state => "MA", :phone => "4566548798", :zip => 10002},  
                   {:address1 => "1 1st st", :address2 => "apt 1", :city => "Framingham", :state => "MA", :phone => "999-888-000", :zip => 99212},  
                   {:address1 => "99 Broadway Ave", :city => "Springfield", :state => "MA", :phone => "789-654-0201", :zip => 34523}]) 

destinations[0..1].each do |d|
  d.order = orders1.first
  d.save
end
destinations[1..4].each do |d|
  d.order = orders1.last
  d.save
end
destinations[5..5].each do |d|
  d.order = orders2.first
  d.save
end
destinations[6..-1].each do |d|
  d.order = orders1.last
  d.save
end
