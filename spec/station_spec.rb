require 'station'

describe Station do
  it "should return the default station zone" do
    expect(subject.zone).to eq 1
  end

  it "should return set station zone" do
    station = Station.new(3)
    expect(station.zone).to eq 3
  end
end
