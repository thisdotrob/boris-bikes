require 'docking_station.rb'
require 'bike.rb'

  describe DockingStation do

    let(:bike) { double :bike}
    it { is_expected.to respond_to :release_bike }

    it "modifies capacity according to initialize argument" do
      station = DockingStation.new(DockingStation::DEFAULT_CAPACITY + 1)
      (DockingStation::DEFAULT_CAPACITY + 1).times { station.dock(bike) }
      expect {station.dock(bike)}.to raise_error('docking station is full')
    end

    it "creates a bike when release_bike is called" do
      bike = double("bike", :working => true)
      subject.dock(bike)
      bike = subject.release_bike
      expect(bike.working).to eq true
    end

    it "raises error when there are no bikes available" do
      expect {subject.release_bike}.to raise_error('No bikes in docking station')
    end

    it "raises error when a docking station is full with default capacity" do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(bike) }
      expect {subject.dock(bike)}.to raise_error('docking station is full')
    end

    it "does not release broken bikes" do
      bike = double("bike", {:working => false, :break => false})
      bike.break
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error('no working bikes available')
    end

    it "user reports working state of bike" do
      bike = double("bike", {:break => false, :working => false})
      bike.break
      subject.dock(bike)
      expect(subject.bikes.last.working).to eq false
    end

    let(:bike1) { double :bike1}
    let(:bike2) { double :bike2}

    it "releases a working bike when there are broken bikes present" do
      bike1 = double("bike1", :working => true)
      bike2 = double("bike2", {:break => false, :working => false})
      bike2.break
      subject.dock(bike1)
      subject.dock(bike2)
      expect(subject.release_bike).to eq bike1
    end


end
