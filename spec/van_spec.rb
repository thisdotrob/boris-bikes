require 'van'

describe Van do
  let(:bike){ instance_double('bike') }
  let(:broken_bike){ instance_double('bike') }
  let(:station){ instance_double('station', release_broken_bikes: [broken_bike]) }
  let(:garage){ instance_double('garage', fix_bikes: [bike]) }

  describe '#collect_broken_bikes' do
    it 'collects broken bikes from the docking station' do
      expect(station).to receive(:release_broken_bikes)
      subject.collect_broken_bikes(station)
    end
  end

  describe '#deliver_working_bikes' do
    it 'docks the working bikes in the station' do
      expect(station).to receive(:dock_bike).with(bike)
      subject.fix_bikes(garage)
      subject.deliver_working_bikes(station)
    end
    it 'removes the working bikes from the van' do
      expect(station).to receive(:dock_bike).twice.with(bike)
      2.times do
        subject.fix_bikes(garage)
        subject.deliver_working_bikes(station)
      end
    end
  end

  describe '#fix_bikes' do
    it 'fixes the bikes at a garage' do
      expect(garage).to receive(:fix_bikes).with([broken_bike])
      subject.collect_broken_bikes(station)
      subject.fix_bikes(garage)
    end
  end

end
