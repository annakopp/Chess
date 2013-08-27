class Tile
  attr_writer :threatened
  attr_reader :loc

  def initialize(row, col)
    @threatened = false
    @row = row
    @col = col
  end

  def threatened?
    @threatened
  end
end