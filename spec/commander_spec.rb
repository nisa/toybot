require 'commander'
require 'toy_bot'
require 'table'
require 'pry'
describe Commander do
  let(:toy) { ToyBot.new() }
  let(:table) { Table.new({x_max: 4, y_max: 4, origin: :SW }) }
  let(:commander) { Commander.new(toy: toy, table: table)}

  describe 'place' do
  	it 'depends on an object that responds to set_position' do
      expect(toy).to receive(:set_position).with(x: 1, y: 1, direction: :NORTH)
  	  commander.place(['1', '1','NORTH'])	
  	end
  end
  
  it 'depends on an object that responds to next valid cordinates' do
    toy.x =  1
    toy.y = 1
    toy.direction = :NORTH
    expect(table).to receive(:next_valid_cordinates).with(toy).and_return({x: 1, y:2})
    commander.move
  end

  describe 'left' do
  	it 'sends turn_left command to toy' do
      expect(toy).to receive(:turn_left)
  	  commander.left
  	end
  end

  describe 'right' do 
    it 'sends turn_right command to toy' do
      expect(toy).to receive(:turn_right)
      commander.right
    end
  end

  describe 'report' do
  	it 'reports toy cordinates' do
      expect(toy).to receive(:report)
      commander.report
  	end
  end
end