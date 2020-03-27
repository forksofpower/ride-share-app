class Game
    attr_reader :user, :difficulty, :grid
    def initialize(user:, difficulty: 'easy')
        @user = user
        @difficulty = difficulty
        @grid = Grid.new(20, 20)

        self.populate
    end

    def populate(driver_count: 3, passenger_count: 20, event_count: 20)
        event_count.times do |i|
            event = Event.all[i]
            event.location = self.grid.random_tile
            event.save
        end

        passenger_count.times do |i|
            passenger = Passenger.all[i]
            passenger.location = self.grid.random_tile
            passenger.save
        end 

        driver_count.times do |i|
            driver = Driver.all[i]
            driver.location = self.grid.random_tile
            driver.save
        end 

        # put user-driver on random-tile

        # start user with ride
    end
end