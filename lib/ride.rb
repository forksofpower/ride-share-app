class Ride < ActiveRecord::Base
    belongs_to :driver
    belongs_to :passenger

    def move_to(tile_id)
        self.tile_id = tile_id
    end
end