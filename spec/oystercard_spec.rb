require "oystercard"
describe Oystercard do

  subject(:oystercard) { described_class.new }
  let(:station) { double(:station, zone: 1) }
  let(:station4) { double(:station4, zone: 4) }

  describe "#initialization" do
    it "initializes with a balance of 0" do
      expect(oystercard.balance).to be_zero
    end
  end

  describe "#top_up" do
    before do
      oystercard.top_up(Oystercard::DEFAULT_LIMIT)
    end
    it "adds a given amount to the balance" do
      expect(oystercard.balance).to eq Oystercard::DEFAULT_LIMIT
    end

    it "raises an error when an added amount makes the balance exceed 90" do
      expect{ oystercard.top_up(1) }.to raise_error("Exceeds balance limit (#{Oystercard::DEFAULT_LIMIT})")
    end
  end

  describe "#touch_in" do
    it "sets the card to be in journey" do
      oystercard.top_up(Oystercard::DEFAULT_MIN)
      oystercard.touch_in(station)
      expect(oystercard).to be_in_journey
    end
    it "raises an error if the balance is less than 1" do
      expect{ oystercard.touch_in(station) }.to raise_error("Insufficient balance")
    end
    it "charges a penalty fare if the last journey wasn't completed" do
      oystercard.top_up(Journey::MINIMUM_CHARGE)
      oystercard.touch_in(station)
      expect{ oystercard.touch_in(station4) }.to change{ oystercard.balance }.by(-Journey::PENALTY_FARE)
    end
  end

  describe "#touch_out" do
    it "signals that the Oystercard has finished a journey" do
      oystercard.touch_out(station4)
      expect(oystercard).not_to be_in_journey
    end
    it "deducts the minimum charge when travelling to the same zone" do
      oystercard.top_up(Journey::MINIMUM_CHARGE)
      oystercard.touch_in(station)
      expect { oystercard.touch_out(station) }.to change{ oystercard.balance }.by(-Journey::MINIMUM_CHARGE)
    end
    it "charges a penalty fare if not in a journey" do
      expect { oystercard.touch_out(station4) }.to change{ oystercard.balance }.by(-Journey::PENALTY_FARE)
    end
  end

  describe "#in_journey" do
    it "returns true or false" do
      expect(oystercard.in_journey?).to eq(true).or eq false
    end
  end
end
