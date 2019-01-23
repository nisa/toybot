class Table
  attr_accessor :y_max, :x_max, :origin
  DIRECTION_METHOD_MAP = { SW: { NORTH: 'next_y', SOUTH: 'previous_y', EAST: 'next_x', WEST: 'previous_x' }}

  def initialize(y_max:, x_max:, origin:)
  	@y_max = y_max
  	@x_max = x_max
  	@origin = origin
  end

  def valid?(cordinates)
    cordinates[:x] >= 0 && cordinates[:y] >= 0 && cordinates[:x] <= x_max && cordinates[:y] <= y_max
  end

  def next_valid_cordinates(toy)
    method_name = DIRECTION_METHOD_MAP.dig(origin, toy.direction)
    cordinate = self.send(method_name.to_sym, toy)	
    cordinate if valid?(cordinate)
  end

  private

  def next_y(toy)
  	{y: toy.y + 1 , x: toy.x}
  end

  def next_x(toy)
  	{x: toy.x + 1, y: toy.y}
  end

  def previous_x(toy)
    {x: toy.x - 1, y: toy.y}
  end

  def previous_y(toy)
    {y: toy.y - 1, x: toy.x}
  end
end