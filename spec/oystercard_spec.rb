require 'oystercard'

describe Oystercard do
  subject {Oystercard.new}
  let :station {double(:station)}

  describe "#balance" do
    it "should return a balance" do
      expect(subject.balance).to be_instance_of(Integer)
    end
  end
  describe "#top_up" do
  	it "should accept a top up" do
  	  expect(subject.top_up(20)).to eq(Oystercard::DEFAULT_STARTING_BALANCE + 20)
  	end
  	it "should not be able to go above limit" do
  	  expect{subject.top_up(100)}.to raise_error("Max £#{Oystercard::DEFAULT_LIMIT}, fool")
  	end
  end
  describe "#in_journey?" do
  	it "should return false when not on a journey" do
  	  expect(subject.in_journey?).to eq false
  	end
  end
  describe "#touch_in" do
  	it "should start a journey" do
  	  subject.touch_in (station)
  	  expect(subject.in_journey?).to eq true
  	end
  	it "shouldn't start a journey when card has less than £#{Oystercard::DEFAULT_MINIMUM}" do
      10.times do
      	subject.touch_in(station)
      	subject.touch_out
      end
      expect{subject.touch_in(station)}.to raise_error "Not enough pennies, poor Baggins-McGee"
  	end
  	it "should remember the station" do
  	  expect{subject.touch_in(station)}.to change {subject.entry_station}.to eq station
  	end
  end
  describe "#touch_out" do
  	before do
  	  subject.touch_in(station)
    end
  	it "should end a journey" do
  	  subject.touch_out
  	  expect(subject.in_journey?).to eq false
  	end
  	it "should charge a journey fare" do
  		expect {subject.touch_out}.to change {subject.balance}.by(-Oystercard::DEFAULT_MINIMUM)
  	end
  	it "should forget entry station" do
  		expect {subject.touch_out}.to change {subject.entry_station}.to eq nil
  	end
  end
  describe "#entry_station" do
  	before do
  	  subject.touch_in(station)
  	end
  	it "returns the entry station" do
  		expect(subject.entry_station).to eq station
  	end
  end
end