require 'bike'

describe Bike do
  describe '#working?' do
    context 'when initialized' do
      it 'should respond with true' do
        expect(subject.working?).to eq(true)
      end
    end
  end

  describe '#break' do
    it 'should break a bike' do
      subject.break
      expect(subject.working?).to eq(false)
    end
  end

end
