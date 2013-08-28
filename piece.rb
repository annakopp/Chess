class Piece
  attr_reader :color, :token
  attr_accessor :loc

  def initialize(color, loc)
    @color = color
    @token = " ? "
    @loc = loc
  end

  def move(from, to, board)
    if valid_move?(to, board)
      self.loc = to

      board[from[0]][from[1]] = nil
      board[to[0]][to[1]] = self
    end
  end

  def valid_move?
    false #raise error (NotImplemented)
  end



end