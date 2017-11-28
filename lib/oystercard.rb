require_relative 'station'
require_relative 'journey'

class Oystercard
  DEFAULT_STARTING_BALANCE = 10
  DEFAULT_LIMIT = 90
  DEFAULT_MINIMUM = 1
  attr_reader :balance, :journey_log, :journey

  def initialize
    @balance = DEFAULT_STARTING_BALANCE
    @journey_log = []
    @journey = false
    @touched_in = false
  end

  def top_up amount
  	raise "Max £#{DEFAULT_LIMIT}, fool" if too_much? amount
  	@balance += amount
  end

  def touch_in station
  	raise "Not enough pennies, poor Baggins-McGee" if not_enough?
    @journey = Journey.new(station, @touched_in)
    @touched_in = true
  end

  def touch_out station
  	deduct(@journey.fare)
    @journey_log.push({@journey.entry_station => station})
    @touched_in = false
    @journey.finish
  end

  def in_journey?
  	@journey != false ? @journey.status : "Not on a journey"
  end

private

  def deduct amount
  	@balance -= amount
  end

  def too_much? amount
    @balance + amount > DEFAULT_LIMIT
  end

  def not_enough?
  	@balance < DEFAULT_MINIMUM
  end

end
