class Piece
  attr_reader :color, :token
  attr_accessor :loc

  def initialize(color, loc)
    @color = color
    @token = "?"
    @loc = loc
  end

  def move(from, to, board)
    if valid_move?(to, board)
      self.loc = to
      board.update(from, self.loc)
    end
  end

  def valid_move?
    false #raise error (NotImplemented)
  end



end