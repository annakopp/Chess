class Game
  def initialize
    @board = make_board
  end

  def make_board
    @board = Array.new(8) do |row|
      Array.new(8) { |col| Tile.new(row, col) }
    end
  end

end