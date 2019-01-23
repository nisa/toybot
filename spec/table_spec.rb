require 'table'
describe Table do
  let('toy') { double 'toy' }
  let(:subject) { Table.new({x_max: 4, y_max: 4, origin: :SW}) } 

  describe 'next_valid_cordinates' do
    it 'returns next index on table' do
      allow(toy).to receive(:y).and_return(1)
      allow(toy).to receive(:x).and_return(1)
      allow(toy).to receive(:direction).and_return(:NORTH)
      expect(subject.next_valid_cordinates(toy)).to eq({x:1, y:2})
    end
  end

  describe 'valid' do
    it 'returns true if cordinates fit the table' do
      expect(subject.valid?({x: 0, y: 0, direction: :NORTH })).to be_truthy
    end
    it 'returns false if cordinates dont fit the table' do
      expect(subject.valid?({x: 0, y: 5, direction: :NORTH })).to be_falsey
    end
  end
end