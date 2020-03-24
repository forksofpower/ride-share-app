class Route
    attr_accessor :id, :tile
    @@all = []

    def initialize(id, tile)
        @id = id
        @tile = tile
        save
    end

    def save
        @@all << self
    end
end