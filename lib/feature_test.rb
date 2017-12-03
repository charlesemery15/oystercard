require "./lib/oystercard"
require "./lib/station"
require "./lib/journey"
p card = Oystercard.new
p station = Station.new(name: "paris", zone: 3)
p journey = Journey.new
