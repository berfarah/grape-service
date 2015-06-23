# Adding code for sake of tests
class App::Error; CODE = 900; end # rubocop:disable all

describe App::Error do
  let(:e) { described_class.new }

  describe '#code' do
    it 'should be the same as CODE' do
      expect(e.code).to eq(described_class::CODE)
    end
  end

  describe '#message' do
    it 'should default to the class name' do
      expect(e.message).to eq('Error')
    end
  end
end
