load 'piece.rb'
load 'pawn.rb'
load 'tile.rb'
load 'rook.rb'

class Game
  attr_accessor :board

  def initialize
    @board = make_board
  end

  def make_board
    # 8.times do |x|
    #   temp = []
    #   8.times do |y|
    #     temp << Tile.new(x, y)
    #   end
    #   @board << temp
    # end
    #
    # board[x][y] = tile(x,y)
    #

    @board = Array.new(8) do |y|
      Array.new(8) { |x| Tile.new(y, x) }
    end
    print_board
  end

  # def [](x,y)
  #   @board[y][x]
  # end

  def print_board
    render
    puts "\n---------------------------------"
    @board.each do |row|
      print "|"
      row.each do |col|
        print col.appearance + "|"
      end
      puts "\n---------------------------------"
    end
  end

  def render
    board.each do |row|
      row.each do |tile|
        tile.refresh
      end
    end
  end

end