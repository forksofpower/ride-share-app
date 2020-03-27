require_relative '../config/environment.rb'

#drivers
20.times do |i|
    name = Faker::Name.unique.name_with_middle
    location = "tl-99-99"
    Driver.create(name: name, location: location)
end

#passengers
20.times do |i|
    name = Faker::Name.unique.name_with_middle
    location = "tl-0-0"
    Passenger.create(name: name, location: location)
end


binding.pry