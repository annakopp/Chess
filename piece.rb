load 'bishop.rb'
load 'pawn.rb'
load 'rook.rb'
load 'queen.rb'

class Piece
  attr_reader :color, :token
  attr_accessor :loc, :possible_moves

  def initialize(color, loc)
    @color = color
    @token = " ? "
    @loc = loc
    @possible_moves = []
  end

  def move(from, to, board)
    if valid_move?(to, board)
      self.loc = to

      board[from[0]][from[1]] = nil
      board[to[0]][to[1]] = self
    end
  end

  def valid_move?(to, board)
    @possible_moves.include?(to)
  end

  def out_of_bounds?(pos)
    !pos[0].between?(0,7) || !pos[1].between?(0,7)
  end

  def edible?(pos, board)
    return false if out_of_bounds?(pos)
    !board[pos[0]][pos[1]].nil? && board[pos[0]][pos[1]].color != color
  end


end