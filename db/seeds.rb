# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#Time
=begin
Time.parse('2010 10 5 220001')
Time.new('2010 01 5 122134')
Time.local('2010 07 5 121212')
Time.gm('2010 10 5 121212')
Time.utc('2010 5 12 121212')
=end

tours = [Tour.create(id: 1,
                name: 'wonder kiev paris',
                description: 'wonderful travel from to and have fun',
                departure_date: Time.new(2008,6,12, 10,30,0, "+02:00"),
                return_date: Time.new(2008,6,21, 13,40,0, "+02:00"),
                from_city: 'kiev',
                to_city: 'paris',
                price: 190),
 Tour.create(id: 2,
                name: 'wonder lviv wien',
                description: 'wonderful travel from to and have fun',
                departure_date: Time.parse('29-07-2009 13:30:0 UTC'),
                return_date: Time.parse('02-08-2009 09:01:00 UTC'),
                from_city: 'kiev',
                to_city: 'paris',
                price: 100),
 Tour.create(id: 3,
                name: 'wonder lviv rome',
                description: 'wonderful travel from to and have fun',
                departure_date: Time.local(2009,"Sep",21, 13,30,0, "+09:00"),
                return_date: Time.local(2009,"Oct",17, 13,30,0, "+09:00"),
                from_city: 'kiev',
                to_city: 'paris',
                price: 120)]

hotels = Hotel.create([{:id => 1,
                  :title => "golden 4 stars",
                  :description => "awesome hotel for family",
                  :city => 'Paris',
                  :rating => 5},
                  {:id => 2,
                  :title => "milan central",
                  :description => "some text",
                  :city => 'Munchen',
                  :rating => 4},
                  {:id => 3,
                  :title => "wien garden",
                  :description => "some text",
                  :city => 'Wien',
                  :rating => 3}])
=begin
reservation
user
and what else
=end