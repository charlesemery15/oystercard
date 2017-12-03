require "journey"
describe Journey do

  subject(:journey) { described_class.new(station) }
  let(:bad_journey) { described_class.new(nil) }
  let(:journey4) { described_class.new(station4) }
  let(:station) { double(:station, zone: 1) }
	let(:station4) { double(:station4, zone: 4) }

  describe "#finish" do
    it "makes a journey with an entry station complete" do
      journey.finish(station)
      expect(journey.complete?).to eq true
    end
    it "makes a journey with no entry station complete" do
      bad_journey.finish(station)
      expect(bad_journey.complete?).to eq true
    end
    it "sets the station passed in as the exit station" do
      journey.finish(station)
      expect(journey.exit_station).to eq station
    end
  end

  describe "#fare" do
    it "charges a penalty when there is no exit station" do
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
    it "charges a penalty fare when there is no entry station" do
      bad_journey.finish(station)
      expect(bad_journey.fare).to eq Journey::PENALTY_FARE
    end
    it "charges the correct fare when the exit zone is higher than the entry zone" do
      journey.finish(station4)
      expect(journey.fare).to eq 4
    end
    it "charges the correct fare when the entry zone is higher than the exit zone" do
      journey4.finish(station)
      expect(journey4.fare).to eq 4
    end
  end
end
