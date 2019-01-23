class Commander
  def initialize(table:, toy:)
  	@table = table
  	@toy = toy
  end

  def place(position)
    position = { x: position[0].to_i, y: position[1].to_i, direction: position[2].to_sym }
    @toy.set_position(x: position[:x], y: position[:y], direction: position[:direction]) if @table.valid?(position)
  end

  def left *args
  	@toy.turn_left
  end

  def right *args
  	@toy.turn_right
  end

  def move *args
  	new_cordinates = @table.next_valid_cordinates(@toy)
  	@toy.set_position(x: new_cordinates[:x], y: new_cordinates[:y], direction: @toy.direction)
  end

  def report *args
  	puts @toy.report
  end
end