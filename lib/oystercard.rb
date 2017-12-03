require_relative "station.rb"
require_relative "journey_log.rb"

class Oystercard

  attr_reader :balance
  DEFAULT_LIMIT = 90
  DEFAULT_MIN = 1

  def initialize
    @balance = 0
    @journey_log = JourneyLog.new
  end

  def top_up(added)
    fail "Exceeds balance limit (#{DEFAULT_LIMIT})" if @balance + added > DEFAULT_LIMIT
    @balance += added
  end

  def touch_in(entry)
    fail "Insufficient funds" if @balance < DEFAULT_MIN
    deduct(@journey_log.touch_in(entry))
  end

  def touch_out(station)
    deduct(@journey_log.touch_out(station))
  end

  def in_journey?
    @journey_log.in_journey?
  end

  private

  def deduct(subtracted)
    @balance -= subtracted
  end

end
