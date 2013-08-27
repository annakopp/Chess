load 'piece.rb'
load 'pawn.rb'
load 'tile.rb'
load 'rook.rb'

class Game
  attr_accessor :board

  def initialize
    @board = make_board
  end

  def run
    pawn1 = Pawn.new("w")
    board[0][1].piece = pawn1
    rook1 = Rook.new("w")
    board[0][0].piece = rook1

    pawn2 = Pawn.new("b")
    board[7][6].piece = pawn2
    rook2 = Rook.new("b")
    board[7][7].piece = rook2

    loop do
      print_board

      puts "from?"
      from = gets.chomp.split(" ").map { |num| num.to_i}
      puts "to?"
      to = gets.chomp.split(" ").map { |num| num.to_i}

      board[from[0]][from[1]].piece.move(board[from[0]][from[1]], board[to[0]][to[1]], board)

    end


  end

  def make_board
    @board = Array.new(8) do |y|
      Array.new(8) { |x| Tile.new(y, x) }
    end
    print_board
  end

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