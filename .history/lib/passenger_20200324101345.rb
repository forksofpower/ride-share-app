class Passenger
    attr_accessor :id, :name, :location

    def initialize(id, name, location)
        @id = id
        @name = name
        @location = location
    end
end