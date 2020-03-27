# require 'pry'
class Grid
    attr_reader :height, :width

    def initialize(height, width)
        @height = height
        @width = width
    end

    def self.linear_distance(tile_a, tile_b)
        # calculate the distance between two tiles
        x1, y1 = Tile.tile_to_coordinates(tile_a)
        x2, y2 = Tile.tile_to_coordinates(tile_b)
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

    def self.find_subdivided_path(start, dest, step)
        start_tile = Tile.from_string(start)
        end_tile   = Tile.from_string(dest)

        # start horizontal
        x, y = end_tile.x, start_tile.y

        # right angle
        turn_tile = Tile.new(x, y)

        # x direction
        if (start_tile.x > end_tile.x)
            # moving left
            x_direction = 'left'
        else
            # moving right
            x_direction = 'right'
        end

        # y direction
        if (start_tile.y > end_tile.y)
            # moving down
            y_direction = 'down'
        else
            # moving right
            y_direction = 'up'
        end

        # subdivide x values between start_tile and turn_tile
        x_leg = []
        x_divisions = (turn_tile.x - start_tile.x).abs / step
        x_count = (1..x_divisions).to_a
        x_count = x_count.reverse if x_direction == 'left'

        x_count.each do |i|
            # binding.pry
            x_leg << Tile.new( (i*step), y)
        end

        # subdivide y values between turn_tile and end_tile
        y_leg = []
        y_divisions = (turn_tile.y - end_tile.y).abs / step
        y_count = (1..y_divisions).to_a
        y_count = y_count.reverse if y_direction == 'down'

        y_count.each do |i|
            # binding.pry
            y_leg << Tile.new(end_tile.x, (i*step) )
        end

        [start_tile, x_leg, turn_tile, y_leg, end_tile].flatten
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

    def to_s
        @id
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
