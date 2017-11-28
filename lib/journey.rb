class Journey
  DEFAULT_STATION = nil
  PENALTY_FARE = 6
  NORMAL_FARE = 1

  attr_reader :entry_station, :fare

  def initialize(station = DEFAULT_STATION, touched_in = false)
    @penalise = true if touched_in == true
    @status = true
    @entry_station = station
  end

  def finish
    @status = false
    @penalise = false
    @entry_station = nil
  end

  def fare
    (@status && !@penalise) ? 1 : PENALTY_FARE
  end

  def status
    @status ? "On a journey" : "Not on a journey"
  end

end
