require "station"

describe Station do
  subject(:station) { described_class.new("Old Street", 1) }

  describe "initialization" do
    it "gives a name to the station instance which can be checked" do
      expect(station.name).to eq("Old Street")
    end
    it "sets a station's zone, which can be checked" do
      expect(station.zone).to eq(1)
    end
  end
end
