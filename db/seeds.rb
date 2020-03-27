require_relative '../config/environment.rb'

DRIVER_SEED_COUNT = 4
USER_SEED_COUNT = 4
PASSENGER_SEED_COUNT = 50
EVENT_SEED_COUNT = 50

#users
USER_SEED_COUNT.times do |i|
    name = Faker::Name.unique.name_with_middle
    email = Faker::Internet.unique.email
    User.create(name: name, email: email, npc: true)
end

#drivers
DRIVER_SEED_COUNT.times do |i|
    name = Faker::Name.unique.name_with_middle
    location = "tl-99-99"
    Driver.create(name: name, location: location, user: User.all[i])
end

#passengers
PASSENGER_SEED_COUNT.times do |i|
    name = Faker::Name.unique.name_with_middle
    location = "tl-0-0"
    Passenger.create(name: name, location: location)
end


client = Ticketmaster.client(
    apikey: 'LhZIx665tzK5OOkSWTqd1xWHFHvfpAs3'
)

params = { 
    city: 'Austin',
    size: EVENT_SEED_COUNT
}
response = client.search_events(params: params)
scheduled_events = response.results


scheduled_events.each do |e|
    Event.create(
        date: Time.now,
        name: e.name,
        location: "tl-35-35",
        venue_name: e.venues.first.name
    )
end

# ap JSON.parse(events)
#  or maybe
# ap JSON.parse(response.results)

#api key: bf27583fe3msh96b2dbde18518b8p19b77cjsn34fe99e7e574
#ticketmaster key: LhZIx665tzK5OOkSWTqd1xWHFHvfpAs3


binding.pry