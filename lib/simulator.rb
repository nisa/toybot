require 'toy_bot'
require 'table'
require 'command_parser'
require 'commander'
class Simulator
  def initialize(table:, command_file:)
  	@toy_bot = ToyBot.new()
  	@table = Table.new(table)
  	@commands_to_execute = CommandParser.new.parse(command_file)
  end

  def simulate
  	commander = Commander.new(toy: @toy_bot, table: @table)
    @commands_to_execute.each do |command|
      begin
        commander.send(command.name.to_sym, command.args)
      rescue NoMethodError
      	puts 'command not defined'
      end
    end
  end
end