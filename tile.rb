class Tile
  attr_writer :threatened
  attr_reader :loc
  attr_accessor :piece, :appearance, :x, :y

  def initialize(x, y)
    @threatened = false
    @x = x
    @y = y
    @piece = nil
    @appearance = "#{@x},#{@y}"
  end

  def threatened?
    @threatened
  end

  def refresh
    if piece.nil?
      @appearance = "#{@x},#{@y}"
    else
      @appearance = " #{piece.token} "
    end
  end

end