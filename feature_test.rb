require "./lib/oystercard"
require "./lib/station"
p card = Oystercard.new
p station = Station.new
p card.balance
p card.top_up(20)
p card.balance
begin
	card.top_up(100)
rescue Exception => e
	p e.message
end
p card.balance
#p card.deduct (15)
p card.in_journey?
p card.touch_in station
p card.in_journey?
p card.touch_out
#p card.deduct (15)
begin
	 card.touch_in station
rescue Exception => e
	p e.message
end
p card.top_up (10)
p card.touch_in station
p card.touch_out
p card.balance
p card.touch_in(station)
p card.entry_station
p card.touch_out
p card.journey_log
