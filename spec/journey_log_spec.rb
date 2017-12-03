require 'journey_log'

describe JourneyLog do

	subject(:journey_log) { JourneyLog.new }
	let(:journey_class) { double(:journey_class, new: journey) }
	let(:journey)  { double(:journey, finish: nil, fare: nil, entry_station: true, complete?: true) }
	let(:station) { double(:station, zone: 1) }
	let(:station4) { double(:station4, zone: 4) }

  describe "#start" do
    it "returns a penalty fare if touched in twice" do
      journey_log.start(station)
      expect(journey_log.start(station)).to eq Journey::PENALTY_FARE
    end
  end

  describe "#finish" do
  	it "returns the correct fare when second station is a higher zone" do
  	  journey_log.start(station)
  	  expect(journey_log.finish(station4)).to eq 4
    end
		it "returns the correct fare when second station is a lower zone" do
  	  journey_log.start(station4)
  	  expect(journey_log.finish(station)).to eq 4
    end
  end

  describe "#journeys" do

  	it "returns a list of the journeys" do
  	  journey_log = JourneyLog.new(journey_class)

  	  journey_log.start(station)
  	  journey_log.finish(station)
  	  journey_log.start(station)
  	  journey_log.finish(station)
  	  expect(journey_log.journeys).to eq [journey,journey]
  	end
  end
end
