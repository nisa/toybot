require 'toy_bot'

describe ToyBot do
  let(:subject) { ToyBot.new }

  it 'turns left' do
    subject.set_position(x: 0, y: 0, direction: 'NORTH')
  	subject.turn_left
  	expect(subject.x).to eq 0
    expect(subject.y).to eq 0
    expect(subject.direction).to eq :WEST
  end

  it 'turns right' do
    subject.set_position(x: 0, y: 0, direction: 'NORTH')
    subject.turn_right
    expect(subject.x).to eq 0
    expect(subject.y).to eq 0
    expect(subject.direction).to eq :EAST
  end

  it 'sets position' do
    subject.set_position(x: 0, y: 0, direction: 'NORTH')
    expect(subject.x).to eq 0
    expect(subject.y).to eq 0
    expect(subject.direction).to eq :NORTH
  end

  it 'reports current position' do
    subject.set_position(x: 1, y:1, direction: 'NORTH')
    expect(subject.report).to eq "1, 1, NORTH"
  end
end
