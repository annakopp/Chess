load 'piece.rb'
load 'bishop.rb'
load 'pawn.rb'
load 'rook.rb'
load 'queen.rb'
load 'knight.rb'
load 'king.rb'

class Game

  attr_reader :all_pieces
  attr_accessor :board

  def initialize
    @all_pieces = []
    @board = make_board
  end

  def run

    place_pieces

    loop do
      print_board

      update_possible_moves



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
      @all_pieces << @board[i][1] = Pawn.new("w", [i, 1])
      @all_pieces << @board[i][6] = Pawn.new("b", [i, 6])
    end

    #bishops
    @all_pieces << @board[2][0] = Bishop.new('w', [2, 0])
    @all_pieces << @board[5][0] = Bishop.new('w', [5, 0])
    @all_pieces << @board[2][7] = Bishop.new('b', [2, 7])
    @all_pieces << @board[5][7] = Bishop.new('b', [5, 7])

    #rooks
    @all_pieces << @board[0][0] = Rook.new("w", [0, 0])
    @all_pieces << @board[7][0] = Rook.new("w", [7, 0])
    @all_pieces << @board[0][7] = Rook.new("b", [0, 0])
    @all_pieces << @board[7][7] = Rook.new("b", [7, 7])

    #queens
    @all_pieces << @board[3][0] = Queen.new('w', [3, 0])
    @all_pieces << @board[3][7] = Queen.new('b', [3, 7])

    #knights
    @all_pieces << @board[1][0] = Knight.new('w', [1, 0])
    @all_pieces << @board[6][0] = Knight.new('w', [6, 0])
    @all_pieces << @board[1][7] = Knight.new('b', [1, 7])
    @all_pieces << @board[6][7] = Knight.new('b', [6, 7])

    #kings
    @all_pieces << @board[4][0] = King.new('w', [4, 0])
    @all_pieces << @board[4][7] = King.new('b', [4, 7])
  end

  def update_possible_moves
    @all_pieces.select! { |piece| piece.active }

    @all_pieces.each do |piece|
      piece.find_possible_moves(self)
    end
    nil
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


class HumanPlayer
  LETTERS = {a: 0, b: 1, c: 2, d: 3, e: 4, f: 5, g: 6, h: 7}

  def initialize

  end

  def get_user_input
    puts "from?"
    from = gets.chomp.split(" ")
    from_x = LETTERS[from[0].to_sym]
    from_y = from[1].to_i - 1

    puts "to?"
    to = gets.chomp.split(" ").map { |num| num.to_i }
    to_x = LETTERS[to[0].to_sym]
    to_y = to[1].to_i - 1
  end
end