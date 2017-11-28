require 'journey'

describe Journey do

  #Testing initializing? what to do?

  describe "#finish" do
    it "should be able to finish a journey" do
      expect(subject.finish).to eq nil
    end
  end

  describe "#fare" do
    it "Should give the fare price of the journey" do
      expect(subject.fare).to eq 1
    end

    it "Should alter the fare price to the penalty when touching out without touching in" do
      subject.finish
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end
  end

  describe "#status" do
    it "Should return the status while not on a journey" do
      subject.finish
      expect(subject.status).to eq "Not on a journey"
    end

    it "Should return the status of an ongoing journey" do
      expect(subject.status).to eq "On a journey"
    end
  end
end
