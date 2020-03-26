require_relative '../config/environment.rb'

# #drivers
# 20.times do |i|
#     name = Faker::Name.unique.name_with_middle
#     location = "tl-99-99"
#     Driver.create(name: name, location: location)
# end

# #passengers
# 20.times do |i|
#     name = Faker::Name.unique.name_with_middle
#     location = "tl-0-0"
#     Passenger.create(name: name, location: location)
# end


#api
# require 'json'
# require 'awesome_print'
require 'ticketmaster-sdk'
client = Ticketmaster.client(apikey: 'LhZIx665tzK5OOkSWTqd1xWHFHvfpAs3')
response = client.search_events
events = response.results
events.body

# ap JSON.parse(events)
#  or maybe
# ap JSON.parse(response.results)

#api key: bf27583fe3msh96b2dbde18518b8p19b77cjsn34fe99e7e574
#ticketmaster key: LhZIx665tzK5OOkSWTqd1xWHFHvfpAs3