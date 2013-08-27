load 'piece.rb'
load 'pawn.rb'
load 'rook.rb'

class Game
  attr_accessor :board

  def initialize
    @board = make_board
  end

  def run

    loop do
      print_board

      puts "from?"
      from = gets.chomp.split(" ").map { |num| num.to_i }
      puts "to?"
      to = gets.chomp.split(" ").map { |num| num.to_i }

    end


  end



  def make_board
    @board = Array.new(8) do |y|
      Array.new(8) { |x| nil }
    end

    @board[0][1] = Pawn.new("w", [0, 1])
    @board[0][0] = Rook.new("w", [0, 0])
    print_board
  end

  def print_board
    puts "\n---------------------------"
    @board.each do |row|
      print "|"
      row.each do |col|
        print " #{col.is_a?(Piece) ? col.token : " "} |"
      end
      puts "\n---------------------------"
    end
  end

end