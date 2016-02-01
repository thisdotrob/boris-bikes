require 'docking_station'

describe DockingStation do
  let(:bike_class){ RSpec::Mocks::InstanceVerifyingDouble }
  let(:bike){ instance_double('bike', working?: true) }
  let(:bike2){ instance_double('bike2', working?: true) }
  let(:bike3){ instance_double('bike3', working?: false) }
  subject{ DockingStation.new(bike_class: bike_class) }

  describe '#initialize' do
    it 'defaults to a capacity of 20' do
      expect(DockingStation::CAPACITY).to eq(20)
    end

    it 'sets the capacity' do
      station = DockingStation.new(bike_class: bike_class, capacity: 0)
      expect{ station.dock_bike(bike) }.to raise_error('Docking station full')
    end
  end

  describe '#dock_bike' do
    it 'raises error if type is not Bike' do
      allow(bike).to receive(:is_a?).and_return(false)
      expect{ dock_bike }.to raise_error('Not a bike')
    end

    context 'when capacity has not been reached' do
      it { is_expected.to respond_to(:dock_bike).with(2).arguments }
      it { is_expected.to respond_to(:dock_bike).with(1).arguments }
      context 'and the bike has been reported broken' do
        it 'should call #break on the bike' do
          expect(bike).to receive(:break)
          subject.dock_bike(bike, true)
        end
      end
    end

    context 'when default capacity has been reached' do
      it 'raises an error' do
        DockingStation::CAPACITY.times { dock_bike }
        expect{ dock_bike }.to raise_error('Docking station full')
      end
    end
  end

  describe '#bikes' do
    context 'when all bikes have been released' do
      it 'should respond with []' do
        dock_two_bikes
        subject.release_bike(0)
        subject.release_bike
        expect(subject.bikes).to eq([])
      end
    end

    context 'when bikes have been docked' do
      it 'should respond with the docked bikes' do
        dock_bike
        expect(subject.bikes).to eq([bike])
      end
      it 'should not allow docked bikes to be modified' do
        dock_bike
        subject.bikes.pop
        expect(subject.bikes).to eq([bike])
      end
    end

    context 'when broken bikes have been docked' do
      it 'should only show the working bikes' do
        allow(bike).to receive(:working?).and_return(false)
        dock_bike
        expect(subject.bikes).to eq([])
      end
    end
  end

  describe '#release_bike' do
    context 'when there are no bikes available' do
      it 'should raise an error' do
        expect{ subject.release_bike }
          .to raise_error('No working bikes available')
      end
    end

    context 'when there are bikes available' do
      it 'should respond with a bike' do
        dock_bike
        expect(subject.release_bike).to eq(bike)
      end
      it 'should respond with a selected bike' do
        dock_two_bikes
        expect(subject.release_bike(1)).to eq(bike2)
      end
    end

    context 'when there are only broken bikes available' do
      it 'should raise an error' do
        allow(bike).to receive(:working?).and_return(false)
        dock_bike
        expect{ subject.release_bike }
          .to raise_error('No working bikes available')
      end
    end
  end

  describe '#release_broken_bikes' do
    before :each do
      dock_two_bikes
      2.times { subject.dock_bike(bike3) }
    end
    it 'should return all broken bikes' do
      expect(release_broken).to eq([bike3, bike3])
    end
    it 'should raise an error when there are no broken bikes' do
      release_broken
      expect{ release_broken }.to raise_error('No broken bikes available')
    end
  end

end
