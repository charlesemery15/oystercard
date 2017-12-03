class Journey

  PENALTY_FARE = 6
  MINIMUM_CHARGE = 1

  attr_reader :journey, :entry_station, :fare, :exit_station

  def initialize(entry)
    @entry_station = entry
    @complete = false
  end

  def finish(station)
    @exit_station = station
    @complete = true
  end

  def fare
    correct? ? ((entry_station.zone - exit_station.zone).abs + MINIMUM_CHARGE) : PENALTY_FARE
  end

  def complete?
    !!@complete
  end

  private

  def correct?
    !!(entry_station && exit_station)
  end

end
