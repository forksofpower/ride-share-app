class Driver < ActiveRecord::Base
    has_one :user
    has_many :passengers, through: :rides
end