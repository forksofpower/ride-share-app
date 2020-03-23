Gig Economy Simulator
========================

## Schema
```
Passenger
  id         Integer
  name       Text
  location   Text
Driver
  id        Integer
  driver    Integer
  passenger Integer
  route     Integer
  location  Text
  fare      Float
  tip       Float
Route
  id        Text
  tile(s)   [Text]
```
