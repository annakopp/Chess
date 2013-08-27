class Game
  def initialize
    @board = make_board
  end

  def make_board
    @board = Array.new(8) do |y|
      Array.new(8) { |x| Tile.new(x, y) }
    end
  end

end