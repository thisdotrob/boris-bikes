require 'garage'

describe Garage do
  let(:bike){ instance_double('bike', fix: nil) }

  describe '#fix_bikes' do
    it 'fixes the supplied bikes' do
      expect(bike).to receive(:fix).thrice
      fix_bikes
    end
    it 'returns the fixed bikes' do
      expect(fix_bikes).to eq([bike, bike, bike])
    end
  end

end
