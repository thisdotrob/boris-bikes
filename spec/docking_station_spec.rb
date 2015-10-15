require 'docking_station.rb'
require 'bike.rb'

  describe DockingStation do
    it { is_expected.to respond_to :release_bike }
  end

  describe DockingStation do
    it "creates a bike when release_bike is called" do
      subject.dock(Bike.new)
      bike = subject.release_bike
      expect(bike).to be_working
  end

  describe DockingStation do
    it { is_expected.to respond_to(:dock).with(1).arguments }
  end

  describe DockingStation do
    it "raises error when there are no bikes available" do
      expect {subject.release_bike}.to raise_error('shit there is no bike!')
    end
  end

  describe DockingStation do
    it "raises error when a docking station is full" do
      subject.dock(Bike.new)
      expect {subject.dock(Bike.new)}.to raise_error('docking station is full')
    end
  end


end
