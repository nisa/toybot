require 'command_parser'

describe CommandParser do
  let(:subject) { CommandParser.new }
  describe 'parse' do
    it 'returns command objects with name and args' do
      commands = subject.parse('samples/1.txt')
      expect(commands).to all( be_a(CommandParser::Command) )
      commands.each {|c| expect(c).to respond_to(:name, :args)}
    end
  end
end