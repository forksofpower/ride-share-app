# require 'pry'
class Grid
    attr_reader :height, :width

    def initialize(height, width)
        @height = height
        @width = width
    end

    def self.linear_distance(tile_a, tile_b)
        # calculate the distance between two tiles
        x1, y1 = self.tile_to_coordinates(tile_a)
        x2, y2 = self.tile_to_coordinates(tile_b)
        Math.sqrt((x2 - x1)**2 + (y2 - y1)**2).round(4)
    end

    # find a 90 degree path between two tiles
    def self.find_path(tile_id_a, tile_id_b)
        tile_a = Tile.from_string(tile_id_a)
        tile_b = Tile.from_string(tile_id_b)
        
        # start horizontal
        x, y = tile_a.x, tile_b.y
    
        turn_point = Tile.new(x, y)
    
        # array of three tiles
        [tile_a, turn_point, tile_b]
    end

    def self.find_within_distance(tile_id, collection, distance)
        tile = Tile.from_string(tile_id)
        max_x, min_x = tile.x + distance, tile.x - distance
        max_y, min_y = tile.y + distance, tile.y - distance
    
        # bounded_colletion = collection.map {|x| Tile.from_string(x.location)}.select do |t| 
        #   t.x <= max_x && t.x >= min_x && t.y <= max_y && t.y >= min_y 
        # end
        bounded_colletion.sort_by {|v| linear_distance(tile, v) }
      end

    def self.tile_to_coordinates(tile)
        tile.gsub("tl-", "").split("-").map {|s| s.to_f }
    end

    def self.coordinates_to_tile(x=0, y=0)
        "tl-#{x}-#{y}"
    end
end

class Tile
    attr_reader :x, :y, :id
    def initialize(x=nil, y=nil)
        @x=x
        @y=y
        @id = self.class.coordinates_to_tile(x, y)
    end

    def coordinates
        [@x, @y]
    end

    def self.from_string(tile_string)
        x, y = self.tile_to_coordinates(tile_string)
        tile = self.new(x, y)
    end

    def self.tile_to_coordinates(tile)
        tile.gsub("tl-", "").split("-").map {|s| s.to_i }
    end

    def self.coordinates_to_tile(x=0, y=0)
        "tl-#{x}-#{y}"
    end
end
