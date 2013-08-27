class Tile
  attr_writer :threatened
  attr_reader :loc
  attr_accessor :piece

  def initialize(x, y)
    @threatened = false
    @x = row
    @y = col
    @piece = nil
  end

  def threatened?
    @threatened
  end
end