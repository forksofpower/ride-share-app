class Driver < ActiveRecord::Base
    has_one :user
    has_one :ride
    has_many :passengers, through: :rides
end