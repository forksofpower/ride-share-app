class User < ActiveRecord::Base
    has_one :driver

    def self.find_by_email(email)
        User.all.where(email: email).limit(1)
    end
end