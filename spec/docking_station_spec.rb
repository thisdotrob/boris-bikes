require 'docking_station.rb'
require 'bike.rb'

  describe DockingStation do

    it { is_expected.to respond_to :release_bike }

    it { is_expected.to respond_to(:dock).with(1).argument }

    let(:bike) { double :bike}

    it "creates a bike when release_bike is called" do
      allow(bike).to receive(:working).and_return(true)
      subject.dock(bike)
      bike = subject.release_bike
      expect(bike.working).to eq true
    end

    it "raises error when there are no bikes available" do
      expect {subject.release_bike}.to raise_error('shit there is no bike!')
    end

    it "raises error when a docking station is full" do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(bike) }
      expect {subject.dock(bike)}.to raise_error('docking station is full')
    end

    it "does not release broken bikes" do
      allow(bike).to receive(:break)
      allow(bike).to receive(:working).and_return false
      bike.break
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error('no working bikes available')
    end

    let(:bike1) { double :bike1}
    let(:bike2) { double :bike2}

    it "releases a working bike when there are broken bikes present" do
      allow(bike1).to receive(:working).and_return true
      allow(bike2).to receive(:break)
      allow(bike2).to receive(:working).and_return false
      bike2.break
      subject.dock(bike1)
      subject.dock(bike2)
      expect(subject.release_bike).to eq bike1
    end

    it "user reports working state of bike" do
      bike = double("bike", :break => false)
      bike = double("bike", :working => false)
      allow(bike).to receive(:break)
      allow(bike).to receive(:working).and_return false
      bike.break
      subject.dock(bike)
      expect(subject.bikes.last.working).to eq false
    end
end
