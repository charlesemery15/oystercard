class Oystercard
  DEFAULT_STARTING_BALANCE = 10
  DEFAULT_LIMIT = 90
  DEFAULT_MINIMUM = 1
  attr_reader :balance, :entry_station, :journey_log

  def initialize
    @balance = DEFAULT_STARTING_BALANCE
    @journey_log = []
  end

  def top_up amount
  	raise "Max £#{DEFAULT_LIMIT}, fool" if too_much? amount
  	@balance += amount
  end

  def touch_in station
  	raise "Not enough pennies, poor Baggins-McGee" if not_enough?
  	@entry_station = station
  end

  def touch_out station
  	deduct(DEFAULT_MINIMUM)
    @journey_log.push({@entry_station => station})
  	@entry_station = nil
  end

  def in_journey?
  	@entry_station ? true : false
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
