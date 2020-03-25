require_relative '../config/environment'


passenger = Passenger.new(name: "Patrick", location: "tl-0-0")
driver    = Driver.new(name: "Jack", location: "tl-99-99")
# passenger.save
# driver.save

ride =  Ride.create(
    # driver_id: driver.id,
    # passenger_id: passenger.id,
    route: 1,
    location: "tl-99-99",
    fare: 10.0,
    tip: 2.0
)
ride.driver = driver
ride.passenger = passenger
ride.save

puts ride.passenger

binding.pry