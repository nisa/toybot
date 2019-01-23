class CommandParser  
  Command = Struct.new(:name, :args)

  def parse(path)
  	contents = readfile(path)
    commands = contents.map{ |line| line.split(' ') }
    commands.map do |command|
      args = command[1] && command[1].split(',')
      Command.new(command[0].downcase, args)
    end
  end

  def readfile(path)
    File.readlines(path)
    rescue => e
      puts e.message
      puts "Missing or invalid command file: #{path}"
      exit(1)
  end
end