#require "./lib/oystercard"
require "./lib/station"
require "./lib/journey"
#p card = Oystercard.new
p station = Station.new
p journey = Journey.new
# p card.balance
# p card.top_up(20)
# p card.balance
# begin
# 	card.top_up(100)
# rescue Exception => e
# 	p e.message
# end
# p card.balance
# #p card.deduct (15)
# p card.in_journey?
# p card.touch_in(station)
# p card.in_journey?
# p card.touch_out(station)
# #p card.deduct (15)
# begin
# 	 card.touch_in station
# rescue Exception => e
# 	p e.message
# end
# p card.top_up (10)
# p card.touch_in station
# p card.touch_out(station)
# p card.balance
# p card.touch_in(station)
# p card.entry_station
# p card.touch_out(station)
# p card.journey_log
# p waterloo = Station.new
# p waterloo.zone
# p paddington = Station.new(2)
# p paddington.zone
p journey.status
p journey.status
p journey.finish
p journey.status
p journey.fare
