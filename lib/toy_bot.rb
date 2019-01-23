class ToyBot
  attr_accessor :x , :y, :direction

  def set_position(x:, y:, direction:)
  	@x = x.to_i
  	@y = y.to_i
  	@direction = direction.to_sym
  end

  def turn_left
  	@direction = left[direction].to_sym
  end

  def turn_right
  	@direction = right[direction].to_sym
  end

  def report
  	"#{x}, #{y}, #{direction}"
  end

  private

  def left
  	{ NORTH: 'WEST', SOUTH: 'EAST', WEST: 'SOUTH', EAST: 'NORTH' }
  end

  def right
    { NORTH: 'EAST', SOUTH: 'WEST', WEST: 'NORTH', EAST: 'SOUTH' }
  end
end