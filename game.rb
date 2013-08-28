load 'piece.rb'
load 'pawn.rb'
load 'rook.rb'
load 'bishop.rb'

class Game

  attr_accessor :board

  def initialize
    @board = make_board
  end

  def run

    place_pieces

    loop do
      print_board

      puts "from?"
      from = gets.chomp.split(" ").map { |num| num.to_i }
      puts "to?"
      to = gets.chomp.split(" ").map { |num| num.to_i }

      @board[from[0]][from[1]].move(from, to, @board)
    end


  end

  def make_board
    made_board = Array.new(8) do
      Array.new(8) { nil }
    end
  end

  def place_pieces
    #pawns
    8.times do |i|
      @board[i][1] = Pawn.new("w", [i, 1])
      @board[i][6] = Pawn.new("b", [i, 6])
    end

    #rooks
    @board[0][0] = Rook.new("w", [0, 0])
    @board[7][0] = Rook.new("w", [7, 0])
    @board[0][7] = Rook.new("b", [0, 0])
    @board[7][7] = Rook.new("b", [7, 7])
    
    #bishops
    @board[2][0] = Bishop.new('w', [1, 0])
    @board[5][0] = Bishop.new('w', [1, 0])
    @board[2][7] = Bishop.new('b', [1, 0])
    @board[5][7] = Bishop.new('b', [1, 0])
    
  end


  def print_board

    puts "\n  -------------------------------------------------"
    7.downto(0) do |i|
      print "#{i} |"
      8.times do |j|
        print " #{@board[j][i].is_a?(Piece) ? @board[j][i].token : "   " } |"
      end
      puts "\n  -------------------------------------------------"
    end
    puts "     0     1     2     3     4     5     6     7   "
  end

end