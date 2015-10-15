require 'docking_station.rb'
require 'bike.rb'

  describe DockingStation do
    it { is_expected.to respond_to :release_bike }

    it { is_expected.to respond_to(:dock).with(2).arguments }

    it "creates a bike when release_bike is called" do
      subject.dock(Bike.new)
      bike = subject.release_bike
      expect(bike.working).to eq true
    end

    it "raises error when there are no bikes available" do
      expect {subject.release_bike}.to raise_error('shit there is no bike!')
    end

    it "raises error when a docking station is full" do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
      expect {subject.dock(Bike.new)}.to raise_error('docking station is full')
    end

    it "does not release broken bikes" do
      bike = Bike.new
      subject.dock(bike,false)
      expect { subject.release_bike }.to raise_error('no working bikes available')
    end

    it "releases a working bike when there are broken bikes present" do
      bike1 = Bike.new
      bike2 = Bike.new
      subject.dock(bike1)
      subject.dock(bike2,false)
      expect(subject.release_bike).to eq bike1
    end

    it "user reports working state of bike" do
      bike = Bike.new
      subject.dock(bike,false)
      expect(subject.bikes.last.working).to eq false
    end
end
