class Driver
    attr_accessor :id, :name, :location
    @@all = []

    def initialize(id, name, location)
        @id = id
        @name = name
        @location = location
        save
    end

    def save
        @@all << self
    end
end