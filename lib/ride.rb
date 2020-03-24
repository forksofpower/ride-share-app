class Ride
    attr_accessor :id, :driver, :passenger, :route, :location, :fare, :tip
    @@all = []

    def initialize(id, driver, passenger, route, location, fare, tip)
        @id = id
        @driver = driver
        @passenger = passenger
        @route = route  
        @location = location
        @fare = fare
        @tip = tip
        save
    end

    def save
        @@all << self
    end
end