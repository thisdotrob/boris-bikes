require 'docking_station'

describe DockingStation do
  let(:bike){ instance_double('bike') }

  describe '#initialize' do
    it 'defaults to a capacity of 20' do
      expect(DockingStation::CAPACITY).to eq(20)
    end
    it 'sets the capacity' do
      station = DockingStation.new(0)
      expect{ station.dock_bike(bike) }.to raise_error('Docking station full')
    end
  end

  describe '#dock_bike' do
    context 'when capacity has not been reached' do
      it { is_expected.to respond_to(:dock_bike).with(1).argument }
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
        dock_bike
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
  end

  describe '#release_bike' do
    context 'when there are no bikes available' do
      it 'should raise an error' do
        expect{ subject.release_bike }.to raise_error('No bikes available')
      end
    end
    context 'when there are bikes available' do
      it 'should respond with a bike' do
        dock_bike
        expect(subject.release_bike).to eq(bike)
      end
    end
    context 'when there are only broken bikes available' do
      it 'should raise an error' do
        allow(bike).to receive(:working).and_return(false)
        dock_bike
        expect{ subject.release_bike }.to raise_error('No bikes available')
      end
    end
  end

end
